defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end
  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}
        context ->
          %StackUnderflowError{message: "stack underflow occurred, context: " <> context}
      end
    end
  end

  def divide(list) when length(list) < 2 do
    raise StackUnderflowError, "when dividing"
  end
  def divide(list) do
    do_divide(Enum.reverse(list))
  end
  defp do_divide([head | []]) do
    head
  end
  defp do_divide([_head, 0 | _tail]) do
    raise DivisionByZeroError
  end
  defp do_divide([head, num | tail]) do
    do_divide([head/num | tail])
  end
end
