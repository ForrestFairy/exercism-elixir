defmodule BeerSong do
  @bottles 99..0

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0) do
    "No more bottles of beer on the wall, no more bottles of beer.\n" <>
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
  def verse(1) do
    "1 bottle of beer on the wall, 1 bottle of beer.\n" <>
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
  def verse(2) do
    "2 bottles of beer on the wall, 2 bottles of beer.\n" <>
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
  def verse(number) when number in @bottles do
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" <>
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ @bottles) do
    Enum.reduce(range, "", fn (x, acc) -> acc <> verse(x) <> "\n" end)
    |> String.trim_trailing()
    |> Kernel.<>("\n")
  end
end
