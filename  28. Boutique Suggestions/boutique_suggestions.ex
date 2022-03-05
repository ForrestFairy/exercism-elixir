defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    budget = case Keyword.fetch(options, :maximum_price) do
      {:ok, value} -> value
      _ -> 100.0
    end
    for top <- tops,
        bot <- bottoms,
        top.base_color != bot.base_color &&
        top.price + bot.price <= budget do
      {top, bot}
    end
  end
end
