defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count  < 1, do: raise :error
  def nth(count), do: do_nth(count, 2)

  defp do_nth(1, number) do
    if is_prime?(number) do
      number
    else
      do_nth(1, number + 1)
    end
  end
  defp do_nth(n, 2) do
      do_nth(n - 1, 3)
  end
  defp do_nth(n, number) do
    if is_prime?(number) do
      do_nth(n - 1, number + 2)
    else
      do_nth(n, number + 2)
    end
  end

  defp is_prime?(number) when number in [2,3], do: true
  defp is_prime?(number) when is_integer(number) and number > 1 do
    Enum.all?(3..(floor(number/2)), fn (a) -> rem(number, a) != 0 end)
  end
end
