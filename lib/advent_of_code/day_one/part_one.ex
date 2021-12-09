defmodule AdventOfCode.DayOne.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  def execute(input_file) do
    input_file
    |> read_input(:as_integers)
    |> find_increments_count()
  end

  defp find_increments_count([]), do: 0
  defp find_increments_count([_ | []]), do: 0

  defp find_increments_count([f_measurement | other_measurements]) do
    {increments, _last_measurement} =
      Enum.reduce(other_measurements, {0, f_measurement}, fn measurement,
                                                             {count, l_measurement} ->
        if measurement > l_measurement, do: {count + 1, measurement}, else: {count, measurement}
      end)

    increments
  end
end
