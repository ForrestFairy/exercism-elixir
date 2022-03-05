defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> {0, []} end , opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn ({_id, plot}) -> plot end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn ({id, list}) ->
      {%Plot{plot_id: id + 1, registered_to: register_to}, {id + 1, [%Plot{plot_id: id + 1, registered_to: register_to} | list]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn ({id, list}) ->
      if Enum.any?(list, fn (%Plot{plot_id: curr_id}) -> curr_id == plot_id end) do
        {:ok, {id, Enum.reject(list, fn (%Plot{plot_id: curr_id}) -> curr_id == plot_id end)}}
      else
        {:error, {id, list}}
      end
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_, list} ->
      case Enum.find(list, fn (%Plot{plot_id: curr_id}) -> curr_id == plot_id end) do
        nil -> {:not_found, "plot is unregistered"}
        plot -> plot
      end
    end)
  end
end
