defmodule TakeANumber do
  def start() do
    pid = self()
    spawn(fn () -> loo(pid, 0) end)
  end
  defp loo(receiver, state) do
    receive do
        {:report_state, receiver} ->
          send(receiver, state)
          loo(receiver, state)
        {:take_a_number, receiver} ->
          send(receiver, state + 1)
          loo(receiver, state + 1)
        :stop -> Process.exit(self(), :exit)
        _ -> loo(receiver, state)
    end
  end
end
