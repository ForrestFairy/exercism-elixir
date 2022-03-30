defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    floor((score - 10) / 2)
  end

  @spec ability :: pos_integer()
  def ability do
    Enum.take_random(1..6, 4)
    |> Enum.sort
    |> Enum.drop(1)
    |> Enum.sum
  end

  @spec character :: t()
  def character do
    stats = %DndCharacter{strength: ability(), dexterity: ability(), constitution: ability(), intelligence: ability(), wisdom: ability(), charisma: ability()}
    %DndCharacter{stats | hitpoints: 10 + modifier(stats.constitution)}
  end
end
