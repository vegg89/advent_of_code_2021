defmodule AdventOfCode.DayThree.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file) do
    input_file
    |> read_input(:as_strings)
    |> calculate_power_consumption()
  end

  defp calculate_power_consumption(binaries) do
    {gamma, epsilon} =
      group_bits(%{}, binaries)
      |> get_binary()
    {gamma, _} = Integer.parse(gamma, 2)
    {epsilon, _} = Integer.parse(epsilon, 2)
    gamma * epsilon
  end

  defp group_bits(bit_counts, []), do: bit_counts

  defp group_bits(bit_counts, [binary | left_binaries]) do
    bits = String.codepoints(binary)
    {_index, bit_counts} = add_diagnostic(bits, bit_counts)
    group_bits(bit_counts, left_binaries)
  end

  defp add_diagnostic(bits, bit_counts) do
    Enum.reduce(bits, {0, bit_counts}, fn(bit, {index, count}) ->
      {zeroes, ones} = count[index] || {0, 0}
      postion_bits= if bit == "0", do: {zeroes + 1, ones}, else: {zeroes, ones + 1}
      {index + 1, Map.put(count, index, postion_bits)}
    end)
  end

  defp get_binary(grouped_bits) do
    Enum.reduce(grouped_bits, {"", ""}, fn({_, {zeroes, ones}}, {gamma, epsilon}) ->
      if zeroes > ones do
        {gamma <> "0", epsilon <> "1"}
      else
        {gamma <> "1", epsilon <> "0"}
      end
    end)
  end
end
