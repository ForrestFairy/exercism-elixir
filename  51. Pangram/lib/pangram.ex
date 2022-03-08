defmodule Pangram do
  @alphabet ?A..?Z
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    letters = Map.new(@alphabet, fn (letter) -> {letter, 0} end)
    sentence
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.reduce(letters, fn (letter, acc) ->
        if letter in @alphabet do
          Map.update!(acc, letter, fn (x) -> x+1 end)
        else
          acc
        end
      end)
    |> Enum.all?(fn ({_letter, value}) -> value > 0 end)
  end
end
