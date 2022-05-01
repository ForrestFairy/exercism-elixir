defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: [dot]

  defmacro __using__(opts) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable [init: 1]
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  def handle_frame(%DancingDots.Dot{opacity: opacity} = dot, frame, _opts) when rem(frame, 4) == 0 do
    %DancingDots.Dot{dot | opacity: opacity/2}
  end
  def handle_frame(dot, _frame, _opts) do
    dot
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  def init([velocity: velocity]) when is_number(velocity) do
    {:ok, [velocity: velocity]}
  end
  def init([velocity: velocity]) do
    {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
  end
  def init(opts) do
    {:error, "The :velocity option is required, and its value must be a number. Got: nil"}
  end

  def handle_frame(%DancingDots.Dot{radius: radius} = dot, frame, [velocity: velocity]) do
    %DancingDots.Dot{dot | radius: radius + (frame - 1) * velocity}
  end

end
