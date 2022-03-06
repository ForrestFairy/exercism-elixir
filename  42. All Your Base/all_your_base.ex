defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, _input_base, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end
  def convert(_digits, input_base, _output_base) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end
  def convert([], _, _), do: {:ok, [0]}
  def convert(digits, input_base, output_base) do
    with {:ok, number} <- convert_to_10(digits, input_base) do
      convert_from_10(number, output_base)
    else
      {:error, msg} -> {:error, msg}
    end
  end

  defp convert_to_10(digits, input_base), do: do_convert_to_10(digits, input_base, 0)
  defp do_convert_to_10([], _input_base, result), do: {:ok, result}
  defp do_convert_to_10([head | _tail], _input_base, _result) when head < 0 do
    {:error, "all digits must be >= 0 and < input base"}
  end
  defp do_convert_to_10([head | _tail], input_base, _result) when head >= input_base do
    {:error, "all digits must be >= 0 and < input base"}
  end
  defp do_convert_to_10([head | tail], input_base, result) do
    do_convert_to_10(tail, input_base, input_base * result + head)
  end

  defp convert_from_10(0, _), do: {:ok, [0]}
  defp convert_from_10(number, output_base), do: do_convert_from_10(number, output_base, [])
  defp do_convert_from_10(0, _output_base, digits), do: {:ok, digits}
  defp do_convert_from_10(number, output_base, digits) do
    do_convert_from_10(div(number, output_base), output_base, [rem(number, output_base) | digits])
  end
end
