defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    stacked = for {score, letters} <- input do
      for letter <- letters do
        %{String.downcase(letter) => score}
      end
    end
    stacked = List.flatten(stacked)
    flatten_and_merge(stacked, %{})
  end
  defp flatten_and_merge([], answer), do: answer
  defp flatten_and_merge([head | tail], answer) do
      flatten_and_merge(tail, Map.merge(answer, head))
  end
end
