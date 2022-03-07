defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) when nucleotide in @nucleotides do
    Enum.reduce(strand, 0, fn (nucl, acc) -> if nucl == nucleotide, do: acc + 1, else: acc       end)
  end
  def count(_, _), do: :error

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    answer = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    Enum.reduce(strand, answer, fn (nucl, acc) ->
      case nucl do
        nuc when nuc in @nucleotides -> Map.update(acc, nuc, 1, fn current -> current + 1 end)
        _ -> :error
      end
    end)
  end
end
