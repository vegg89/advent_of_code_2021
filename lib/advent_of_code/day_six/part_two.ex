defmodule AdventOfCode.DaySix.PartTwo do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file, days) do
    input_file
    |> read_input()
    |> String.split(",")
    |> Stream.map(&String.to_integer/1)
    |> prepare_input()
    |> calculate_fishes(days, 0)
  end

  defp prepare_input(fishes) do
    Enum.reduce(fishes, %{}, fn fish, fishes_acc ->
      fish_bithday = fish - 8
      fishes_count = fishes_acc[fish_bithday] || 0
      Map.put(fishes_acc, fish_bithday, fishes_count + 1)
    end)
    |> Enum.sort()
  end

  defp calculate_fishes([], _days, generated_fishes), do: generated_fishes

  defp calculate_fishes([{day, fishes} | new_fishes], days, generated_fishes) do
    new_fishes
    |> add_first_child(day, days, fishes)
    |> calculate_new_fishes(day + 9, days, fishes)
    |> calculate_fishes(days, generated_fishes + fishes)
  end

  defp calculate_new_fishes(new_fishes, from_day, to_days, _) when from_day + 7 > to_days,
    do: new_fishes

  defp calculate_new_fishes(other_new_fishes, from_day, to_days, parent_amount) do
    birthday = from_day + 7
    {_, new_fishes} = List.keyfind(other_new_fishes, birthday, 0, {birthday, 0})

    other_new_fishes
    |> List.keystore(birthday, 0, {birthday, new_fishes + parent_amount})
    |> calculate_new_fishes(birthday, to_days, parent_amount)
  end

  defp add_first_child(new_fishes, day, days, _) when day + 9 > days, do: new_fishes

  defp add_first_child(other_new_fishes, day, _, fishes) do
    birthday = day + 9
    {_, new_fishes} = List.keyfind(other_new_fishes, birthday, 0, {birthday, 0})

    new_fishes = new_fishes + fishes
    List.keystore(other_new_fishes, birthday, 0, {birthday, new_fishes})
  end
end
