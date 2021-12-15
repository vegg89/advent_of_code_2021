defmodule AdventOfCode.DaySeven.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file) do
    crabs =
      input_file
      |> read_input()
      |> String.split(",")
      |> Stream.map(&String.to_integer/1)
      |> Enum.sort()

    position = get_median(crabs)

    Enum.reduce(crabs, 0, fn(crab, acc) ->
      acc + abs(crab - position)
    end)
  end

  defp get_median(crab_list) do
    crabs_count = length(crab_list)
    {first_group, second_group} = Enum.split(crab_list, div(crabs_count, 2))
    if length(second_group) > length(first_group), do: hd(second_group), else: div(hd(second_group) + List.last(first_group), 2)
  end
end
