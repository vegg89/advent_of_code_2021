defmodule AdventOfCode.DayThree.PartTwo do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file) do
    input_file
    |> read_input(:as_strings)
    |> Stream.map(&String.codepoints/1)
    |> Stream.map(&List.to_tuple/1)
    |> calculate_life_support_rating()
  end

  defp calculate_life_support_rating(binaries) do
    {ogr, _} = calculate_rating(:ogr, binaries, 0)
    |> Tuple.to_list
    |> List.to_string
    |> Integer.parse(2)

    {c02, _} = calculate_rating(:c02, binaries, 0)
    |> Tuple.to_list
    |> List.to_string
    |> Integer.parse(2)

    ogr * c02
  end

  defp calculate_rating(_type, [rating|[]], _eval_position), do: rating

  defp calculate_rating(type, binaries, eval_position) do
    groups = Enum.group_by(binaries, &elem(&1, eval_position))
    selected_group = select_group(type, groups["0"], groups["1"])
    calculate_rating(type, selected_group, eval_position + 1)
  end

  defp select_group(:ogr, zeroes, ones) when length(zeroes) > length(ones), do: zeroes
  defp select_group(:ogr, _zeroes, ones), do: ones
  defp select_group(:c02, zeroes, ones) when length(zeroes) > length(ones), do: ones
  defp select_group(:c02, zeroes, _ones), do: zeroes

end
