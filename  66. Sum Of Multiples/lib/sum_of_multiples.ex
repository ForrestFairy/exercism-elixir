defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(_limit, []), do: 0
  def to(limit, factors) do
    1..limit-1
    |> Enum.filter(&(Enum.any?(factors, fn x -> x != 0 && rem(&1, x) == 0 end)))
    |> Enum.sum()
  end
end
