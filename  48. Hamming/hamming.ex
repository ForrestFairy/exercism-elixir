defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    do_hamming_distance(strand1, strand2, 0)
  end
  defp do_hamming_distance([], [], sum), do: {:ok, sum}
  defp do_hamming_distance([_head1 | _tail1], [], _sum), do: {:error, "strands must be of equal length"}
  defp do_hamming_distance([], [_head2 | _tail2], _sum), do: {:error, "strands must be of equal length"}
  defp do_hamming_distance([head1 | tail1], [head2 | tail2], sum) do
    if head1 != head2 do
      do_hamming_distance(tail1, tail2, sum + 1)
    else
      do_hamming_distance(tail1, tail2, sum)
    end
  end
end
