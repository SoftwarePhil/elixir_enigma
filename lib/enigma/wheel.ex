defmodule Enigma.Wheel do

def spin(wheel) do
  with first = elem(wheel, 0) do
  wheel
    |>Tuple.append(first)
    |>Tuple.delete_at(0)
  end
end

def map(key, wheel, num) do

end

def shift(key, offset) when offset !== 0 do
  a = ?a
  z = ?z
  cond do
    offset + key > z -> a - 1 + offset
    offset + key < a -> z + 1 +  offset
    offset -> key + offset
  end
end

def ceaser(letters, offset) do
  Enum.map(letters, fn(x) -> shift(x, offset) end)
end

#might not need these
def key_press(key) do
  [head | _] = key ++ 0
  head
end

def actual_letter(num) do
  [num]
end
# a - z ~~DOES NOT MOVE
# ~~a wheel with letter maps~~ that spins like (a -> e) (b -> z) .. SPIN (a -> w) (b -> e) (c -> z)
# there are three of these
# a reflection ..
#

end
