defmodule RunLengthEncoder do
  @numbers 0..9

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> do_encode()
  end

  defp do_encode([]), do: ""
  defp do_encode([head | tail]), do: do_encode(tail, "", head, 1)
  defp do_encode([], answer, current, 1), do: answer <> current
  defp do_encode([], answer, current, n), do: answer <> to_string(n) <> current
  defp do_encode([head | tail], answer, head, n), do: do_encode(tail, answer, head, n + 1)
  defp do_encode([head | tail], answer, current, 1), do: do_encode(tail, answer <> current, head, 1)
  defp do_encode([head | tail], answer, current, n), do: do_encode(tail, answer <> to_string(n) <> current, head, 1)

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.graphemes()
    |> do_decode()
  end

  defp do_decode([]), do: ""
  defp do_decode(word), do: do_decode(word, "", 0)
  defp do_decode([], answer, 0), do: answer
  defp do_decode([head | tail], answer, number) do
    cond do
      String.contains?(head, @numbers |> Enum.map(&Integer.to_string/1))
        -> do_decode(tail, answer, number * 10 + String.to_integer(head))
      true
        -> add_next([head | tail], answer, number)
    end
  end

  defp add_next([letter | rest], answer, 0), do: do_decode(rest, answer <> letter, 0)
  defp add_next([letter | rest], answer, n), do: do_decode(rest, answer <> String.duplicate(letter, n), 0)
end
