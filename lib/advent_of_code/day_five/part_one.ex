defmodule AdventOfCode.DayFive.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file) do
    lines =
      input_file
      |> read_input(:as_strings)
      |> Enum.map(&String.split(&1, " -> "))

    diagram = generate_diagram(%{}, lines)
    Enum.count(diagram, fn {_, count} -> count > 1 end)
  end

  defp generate_diagram(diagram, []), do: diagram

  defp generate_diagram(diagram, [[point_a, point_b] | other_lines]) do
    [x1, y1] = String.split(point_a, ",") |> Enum.map(&String.to_integer/1)
    [x2, y2] = String.split(point_b, ",") |> Enum.map(&String.to_integer/1)
    new_diagram = add_line(diagram, x1, y1, x2, y2)
    generate_diagram(new_diagram, other_lines)
  end

  defp add_line(diagram, x1, y1, x2, y2) when x1 == x2 or y1 == y2 do
    Enum.reduce(x1..x2, diagram, fn x, acc ->
      Enum.reduce(y1..y2, acc, fn y, acc ->
        count = acc["#{x}-#{y}"] || 0
        Map.put(acc, "#{x}-#{y}", count + 1)
      end)
    end)
  end

  defp add_line(diagram, _x1, _y1, _x2, _y2), do: diagram
end
