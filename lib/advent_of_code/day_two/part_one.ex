defmodule AdventOfCode.DayTwo.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file) do
    input_file
    |> read_input(:as_strings)
    |> calculate_position()
  end

  defp calculate_position(movements) do
    {x, y} = calculate_position({0, 0}, movements)
    x * y
  end

  defp calculate_position(position, []), do: position

  defp calculate_position({x, y}, ["forward " <> units | left_movements]),
    do: calculate_position({x + String.to_integer(units), y}, left_movements)

  defp calculate_position({x, y}, ["down " <> units | left_movements]),
    do: calculate_position({x, y + String.to_integer(units)}, left_movements)

  defp calculate_position({x, y}, ["up " <> units | left_movements]),
    do: calculate_position({x, y - String.to_integer(units)}, left_movements)
end
