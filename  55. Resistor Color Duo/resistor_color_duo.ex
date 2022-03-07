defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([color1, color2 | _colors]) do
    10 * code(color1) + code(color2)
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
