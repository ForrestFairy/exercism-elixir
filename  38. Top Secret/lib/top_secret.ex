defmodule TopSecret do
  def to_ast(string) do
    {:ok, quoted} = Code.string_to_quoted(string)
    quoted
  end

  def decode_secret_message_part(ast, acc) do
    # IO.inspect ast
    # IO.inspect acc
    {operation, meta} = case ast do
      {operation, _keyword, [meta, _do]} -> {operation, meta}
      _rest -> {:none, ""}
    end
    case operation do
      :def ->
        function_name = get_name(meta)
        {ast, [function_name | acc]}
      :defp ->
        function_name = get_name(meta)
        {ast, [function_name | acc]}
      _rest ->
        {ast, acc}
    end
  end

  defp get_name(metadata) do
    {name, _keyword, parameters} = metadata
    # IO.inspect parameters
    leng = case parameters do
      nil -> 0
      list -> length(list)
    end

    name = name
    |> Atom.to_string

    case name do
      "when" ->
        get_name(hd(parameters))
      rest ->
        rest
        |> String.split_at(leng)
        |> elem(0)
    end

  end

  def decode_secret_message(string) do
    data = to_ast(string)
    {_, acc} = Macro.prewalk(data, [], &decode_secret_message_part/2)
    acc |> Enum.reverse() |> Enum.join()
  end
end
