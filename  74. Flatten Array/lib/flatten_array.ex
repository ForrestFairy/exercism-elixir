defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten(list), do: do_flatten(Enum.reverse(list), [])

  defp do_flatten([], result), do: result
  defp do_flatten([nil | tail], result) do
    do_flatten(tail, result)
  end
  defp do_flatten([head | tail], result) when is_list(head) do
    result = do_flatten(Enum.reverse(head), result)
    do_flatten(tail, result)
  end
  defp do_flatten([head | tail], result) do
    do_flatten(tail, [head | result])
  end
end
