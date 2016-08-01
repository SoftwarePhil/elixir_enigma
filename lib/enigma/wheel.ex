defmodule Enigma.Wheel do

def spin(wheel) do
  with first = elem(wheel, 0) do
  wheel
    |>Tuple.append(first)
    |>Tuple.delete_at(0)
  end
end

# a - z ~~DOES NOT MOVE
# ~~a wheel with letter maps~~ that spins like (a -> e) (b -> z) .. SPIN (a -> w) (b -> e) (c -> z)
# there are three of these
# a reflection ..
# 

end
