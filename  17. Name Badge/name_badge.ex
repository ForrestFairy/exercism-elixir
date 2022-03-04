defmodule NameBadge do
  def print(id, name, department) do

    "#{show(id)}#{name} - #{depart(department)}"
  end
  defp show(id) do
    if id do
      "[#{id}] - "
    else
      ""
    end
  end
  defp depart(department) do
    if department do
      "#{String.upcase(department)}"
    else
      "OWNER"
    end
  end
end
