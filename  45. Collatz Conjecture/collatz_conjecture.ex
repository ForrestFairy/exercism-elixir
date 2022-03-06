defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) do
    do_calc(input, 0)
  end
  defp do_calc(1, steps), do: steps
  defp do_calc(input, steps) when input > 0 do
    cond do
      rem(input, 2) == 0 ->
        do_calc(round(input/2), steps + 1)
      input ->
        do_calc(3 * input + 1, steps + 1)
    end
  end
end
