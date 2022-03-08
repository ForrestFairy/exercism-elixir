defmodule RotationalCipher do
  @signs_and_numbers 32..64
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&change(&1, shift))
    |> to_string()
  end

  defp change(letter, shift) do
    cond do
      letter > 96 -> rem(letter - 97 + shift, 26) + 97
      letter > 64 -> rem(letter - 65 + shift, 26) + 65
      letter in @signs_and_numbers -> letter
    end
  end
end
