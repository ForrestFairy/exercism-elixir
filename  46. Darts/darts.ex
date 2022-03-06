defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    case distance(abs(x), abs(y)) do
      dist when dist > 10 -> 0
      dist when dist > 5 -> 1
      dist when dist > 1 -> 5
      _dist -> 10
    end
  end
  defp distance(x, y) do
    answer = x * x + y * y
    :math.sqrt(answer)
  end
end
