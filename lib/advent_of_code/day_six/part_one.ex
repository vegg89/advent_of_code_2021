defmodule AdventOfCode.DaySix.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file, days) do
    fishes =
      input_file
      |> read_input()
      |> String.split(",")
      |> Stream.map(&String.to_integer/1)

    calculate_fishes(fishes, days)
    |> length()
  end

  defp calculate_fishes(fishes, 0), do: fishes

  defp calculate_fishes(fishes, days) do
    new_fishes =
      Enum.reduce(fishes, [], fn fish, fishes_acc ->
        fish_life = fish - 1

        case fish_life do
          -1 ->
            [6 | [8 | fishes_acc]]

          _ ->
            [fish_life | fishes_acc]
        end
      end)

    calculate_fishes(new_fishes, days - 1)
  end
end
