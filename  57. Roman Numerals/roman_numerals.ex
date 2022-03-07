defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number > 0, do: do_numeral(number, "")
  defp do_numeral(0, roman), do: roman
  defp do_numeral(number, roman) when number >= 1000,
    do: do_numeral(number - 1000, roman <> "M")
  defp do_numeral(number, roman) when number >= 900,
    do: do_numeral(number - 900, roman <> "CM")
  defp do_numeral(number, roman) when number >= 500,
    do: do_numeral(number - 500, roman <> "D")
  defp do_numeral(number, roman) when number >= 400,
    do: do_numeral(number - 400, roman <> "CD")
  defp do_numeral(number, roman) when number >= 100,
    do: do_numeral(number - 100, roman <> "C")
  defp do_numeral(number, roman) when number >= 90,
    do: do_numeral(number - 90, roman <> "XC")
  defp do_numeral(number, roman) when number >= 50,
    do: do_numeral(number - 50, roman <> "L")
  defp do_numeral(number, roman) when number >= 40,
    do: do_numeral(number - 40, roman <> "XL")
  defp do_numeral(number, roman) when number >= 10,
    do: do_numeral(number - 10, roman <> "X")
  defp do_numeral(number, roman) when number == 9,
    do: do_numeral(number - 9, roman <> "IX")
  defp do_numeral(number, roman) when number >= 5,
    do: do_numeral(number - 5, roman <> "V")
  defp do_numeral(number, roman) when number == 4,
    do: do_numeral(number - 4, roman <> "IV")
  defp do_numeral(number, roman) when number >= 1,
    do: do_numeral(number - 1, roman <> "I")
end
