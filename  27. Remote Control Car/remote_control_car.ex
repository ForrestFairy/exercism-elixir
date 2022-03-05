defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
       :nickname,
       battery_percentage: 100,
       distance_driven_in_meters: 0
  ]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname \\ "none") do
    %{new() | nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: dist}) do
    Integer.to_string(dist) <> " meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: bat}) do
    case bat do
      0 -> "Battery empty"
      perc -> "Battery at "<> Integer.to_string(perc) <> "%"
    end
  end

  def drive(%RemoteControlCar{battery_percentage: bat,
            distance_driven_in_meters: dist} = car) do
    case bat do
      0 -> car
      perc -> %RemoteControlCar{car | battery_percentage: perc - 1,
            distance_driven_in_meters: dist + 20}
    end
  end
end
