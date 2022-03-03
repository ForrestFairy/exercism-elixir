defmodule HighScore do
  @initial_score 0

  def new() do
    %{}
  end
  def add_player(scores, name), do:
    Map.put(scores, name, @initial_score)
  def add_player(scores, name, score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    {_msg, scores} = Map.pop(scores, name)
    scores
  end

  def reset_score(scores, name) do
    add_player(scores, name, @initial_score)
  end

  def update_score(scores, name, score) do
    current = Map.get(scores, name)
    case current do
      nil -> add_player(scores, name, score)
      _ -> add_player(scores, name, current + score)
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
