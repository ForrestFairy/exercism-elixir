defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    for rank <- rank_range do
      rank
    end
  end

  def files do
    for file <- file_range do
      <<file>>
    end
  end
end
