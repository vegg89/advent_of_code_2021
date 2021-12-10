defmodule AdventOfCode.DayTwo.PartTwo do
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
    {horizontal, depth, _aim} = calculate_position({0, 0, 0}, movements)
    horizontal * depth
  end

  defp calculate_position(position, []), do: position

  defp calculate_position({horizontal, depth, aim}, ["forward " <> units | left_movements]) do
    units = String.to_integer(units)
    calculate_position({horizontal + units, depth + aim * units, aim}, left_movements)
  end

  defp calculate_position({horizontal, depth, aim}, ["down " <> units | left_movements]) do
    units = String.to_integer(units)
    calculate_position({horizontal, depth, aim + units}, left_movements)
  end

  defp calculate_position({horizontal, depth, aim}, ["up " <> units | left_movements]) do
    units = String.to_integer(units)
    calculate_position({horizontal, depth, aim - units}, left_movements)
  end
end
