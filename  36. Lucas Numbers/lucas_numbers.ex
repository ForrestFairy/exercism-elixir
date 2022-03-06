defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(number) when is_bitstring(number) or number < 1 do
    raise ArgumentError, "count must be specified as an integer >= 1"
  end
  def generate(1), do: [2]
  def generate(2), do: [2, 1]
  def generate(number) do
    tail = Stream.iterate({2, 1}, fn {firs, sec} -> {sec, sec + firs} end)
    |> Stream.map(&elem(&1, 1))
    |> Enum.take(number - 1)
    [2 | tail]
  end

end
