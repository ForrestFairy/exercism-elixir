defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def increase_quantity(item, count) do
    quantity = Map.new(Enum.map(item.quantity_by_size, fn {key, value} ->
        {key, value + count} end))
    %{item | quantity_by_size: quantity}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_key, value}, acc -> acc + value end)
  end
end
