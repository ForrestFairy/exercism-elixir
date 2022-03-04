defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end
  defp do_encode([], ans), do: ans
  defp do_encode([head | tail], ans) do
     do_encode(tail, <<ans::bitstring, encode_nucleotide(head) :: 4>>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end
  defp do_decode(<<>>, answer), do: answer
  defp do_decode(dna, answer) do
    <<letter :: 4, rest :: bitstring>> = dna
    do_decode(rest, answer ++ [decode_nucleotide(letter)])
  end
end
