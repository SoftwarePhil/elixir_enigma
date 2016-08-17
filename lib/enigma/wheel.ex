defmodule Enigma.Wheel do
@abc 'abcdefghigklmnopqrstuvwxyz'
@IC {3, 11, 17, 19, 14, 3, 5, 10, 12, 18, 6, 2, -2, -8, -10, -6, -14, -17, 7, -18, -5, -15, 1, -9, -17, -4}
@IIC {7, 15, 23, 3, 11, 4, 13, 5, 6, -5, 1, 2, -10, -5, -9, -12, 8, -17, 4, 2, -16, -1, -4, -6, -14, -2}
@IIIC {20, 15, 11, 16, 7, 13, 19, -2, 4, 11, -6, -4, -9, 2, 9, -5, -8, -16, 3, 5, -14, -12, -20, -1, -10, -25}


def initial_wheel_setup(wheel_1, wheel_2, wheel3) do
  
end

#these are how I generated the above rotors ... passing in the rotor wiring from the wikipedia page as a lowercase charlist
#example ~ create_wheel 'dmtwsilruyqnkfejcazbpgxohv'
def create_wheel(rotor) do
  _create_wheel('', rotor, @abc)
end

defp _create_wheel(old_wheel, [head|sequence], [head2| abc]) do
  old_wheel ++ [find_shift(head, head2)]
  |>_create_wheel(sequence, abc)
end

defp _create_wheel(wheel, [], []) do
  wheel
  |>List.to_tuple
end

defp find_shift(code_letter, abc_letter) do
  code_letter - abc_letter
end

end
