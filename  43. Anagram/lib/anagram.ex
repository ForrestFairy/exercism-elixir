defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(_base, []), do: []
  def match(base, candidates) do
    up_base = base
    |> String.upcase()

    Enum.filter(candidates, &(!String.equivalent?(String.upcase(&1), up_base)))
    |> Enum.filter(&(String.bag_distance(String.upcase(&1), up_base) == 1.0))
  end
end
