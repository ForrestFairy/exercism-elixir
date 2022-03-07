defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  defp years_on_earth(seconds) do
    (((seconds / 60) / 60) / 24) / 365.25
  end
  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    on_earth = years_on_earth(seconds)
    case planet do
      :mercury -> {:ok, Float.round(on_earth / 0.2408467, 2)}
      :venus -> {:ok, Float.round(on_earth / 0.61519726, 2)}
      :earth -> {:ok, Float.round(on_earth, 2)}
      :mars -> {:ok, Float.round(on_earth / 1.8808158, 2)}
      :jupiter -> {:ok, Float.round(on_earth / 11.862615, 2)}
      :saturn -> {:ok, Float.round(on_earth / 29.447498, 2)}
      :uranus -> {:ok, Float.round(on_earth / 84.016846, 2)}
      :neptune -> {:ok, Float.round(on_earth / 164.79132, 2)}
      _ -> {:error, "not a planet"}
    end
  end
end
