defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, naive} = NaiveDateTime.from_iso8601(string)
    naive
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    time.hour < 12
  end

  def return_date(checkout_datetime) do
    date = NaiveDateTime.to_date(checkout_datetime)
    if before_noon?(checkout_datetime) do
      Date.add(date, 28)
    else
      Date.add(date, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.diff(actual_return_datetime, planned_return_date) do
      diff when diff < 0 -> 0
      diff -> diff
    end
  end

  def monday?(datetime) do
    Date.diff(datetime, Date.beginning_of_week(datetime)) == 0
  end

  def calculate_late_fee(checkout, return, rate) do
    check_date = datetime_from_string(checkout)
    return_date = datetime_from_string(return)
    if monday?(return_date) do
      floor(days_late(return_date(check_date), return_date) * rate / 2)
    else
      days_late(return_date(check_date), return_date) * rate
    end
  end
end
