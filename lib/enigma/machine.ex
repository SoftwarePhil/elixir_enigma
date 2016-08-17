defmodule Enigma.Machine do

def encode(wheel, message) do
  _code(wheel, message, '')
end

def decode(wheel, message) do
  Tuple.to_list(wheel)
  |>Enum.map(fn(x)->-x end)
  |>List.to_tuple()
  |>_code(message, '')
end

defp _code(wheel, [head | tail], current_message) do
  _code(spin(wheel), tail, current_message ++ [shift(head, elem(wheel, 0))])
end

defp _code(_, [], current_message) do
  current_message
end

def spin(wheel) do
  with first = elem(wheel, 0) do
  wheel
    |>Tuple.append(first)
    |>Tuple.delete_at(0)
  end
end

defp shift(letter, letter_shift) do
  a = ?a
  z = ?z
  offset = rem(letter_shift, 26)
  cond do
    offset + letter > z -> a - 1 + offset
    offset + letter < a -> z + 1 +  offset
    offset -> letter + offset
  end
end

defp shift(letter, offset) when offset === 0 do
  letter
end

def ceaser(letters, offset) do
  Enum.map(letters, fn(x) -> shift(x, offset) end)
end

#might not need these
def letter_as_number(key) do
  [head | _] = key ++ 0
  head
end

def actual_letter(num) do
  [num]
end

#todo:: make a wheel struct, make a spin wheels function, add starting values to wheels, tests
end
