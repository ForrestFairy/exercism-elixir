defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    do_calculate(radicand, 1)
  end
  defp do_calculate(radicand, square) do
    if square * square == radicand do
      square
    else
      do_calculate(radicand, square + 1)
    end
  end
end
