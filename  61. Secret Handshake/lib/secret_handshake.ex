defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when code < 0, do: :error
  def commands(code) do
    {code, []}
    |> check_1()
    |> check_2()
    |> check_4()
    |> check_8()
    |> check_16()
    |> elem(1)
  end

  defp check_1({code, operations}) do
    if Bitwise.&&&(code, 1) == 1, do: {code, ["wink" | operations]}, else: {code, operations}
  end
  defp check_2({code, operations}) do
    if Bitwise.&&&(code, 2) == 2, do: {code, ["double blink" | operations]}, else: {code, operations}
  end
  defp check_4({code, operations}) do
    if Bitwise.&&&(code, 4) == 4, do: {code, ["close your eyes" | operations]}, else: {code, operations}
  end
  defp check_8({code, operations}) do
    if Bitwise.&&&(code, 8) == 8, do: {code, ["jump" | operations]}, else: {code, operations}
  end
  defp check_16({code, operations}) do
    if Bitwise.&&&(code, 16) == 16, do: {code, operations}, else: {code, Enum.reverse(operations)}
  end
end
