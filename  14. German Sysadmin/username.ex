defmodule Username do
  def sanitize([]), do: ''
  def sanitize([first | rest]) do
    case first do
      first when 123 > first and first > 96 -> [first | sanitize(rest)]
      ?_ -> [first | sanitize(rest)]
      ?ä -> [?a, ?e | sanitize(rest)]
      ?ö -> [?o, ?e | sanitize(rest)]
      ?ü -> [?u, ?e | sanitize(rest)]
      ?ß -> [?s, ?s | sanitize(rest)]
      _ -> sanitize(rest)
    end
  end
end
