defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label([col1, col2, col3 | _colors]) do
    ohms = (10 * code(col1) + code(col2)) * :math.pow(10, code(col3))
    if ohms > 1000 do
      {ohms/1000, :kiloohms}
    else
      {ohms, :ohms}
    end
  end
  defp code(color) do
      case color do
        :black -> 0
        :brown -> 1
        :red -> 2
        :orange -> 3
        :yellow -> 4
        :green -> 5
        :blue -> 6
        :violet -> 7
        :grey -> 8
        :white -> 9
      end
  end
end
