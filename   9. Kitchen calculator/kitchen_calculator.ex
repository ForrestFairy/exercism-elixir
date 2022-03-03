defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter(volume_pair) do
    {unit, volume} = volume_pair
    case unit do
      :milliliter ->{:milliliter, volume}
      :cup -> {:milliliter, 240 * volume}
      :fluid_ounce -> {:milliliter, 30 * volume}
      :teaspoon -> {:milliliter, 5 * volume}
      :tablespoon -> {:milliliter, 15 * volume}
    end
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)
    case unit do
      :milliliter ->{:milliliter, volume}
      :cup -> {:cup,  volume / 240}
      :fluid_ounce -> {:fluid_ounce, volume / 30}
      :teaspoon -> {:teaspoon, volume / 5}
      :tablespoon -> {:tablespoon, volume / 15}
    end
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
