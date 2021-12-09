defmodule AdventOfCode.DayOne.PartTwo do
  @moduledoc """
  Documentation for `DayOne.PartTwo`.
  """
  import AdventOfCode.InputHelpers

  defstruct increments_counter: 0,
            last_measurement: 0,
            group_pointer: 0,
            measurement_groups: {0, 0, 0},
            left_measurements: []

  def execute(input_file) do
    %{increments_counter: result} =
      input_file
      |> read_input(:as_integers)
      |> setup_structure()
      |> find_increments_count()

    result
  end

  defp setup_structure(measurements) when length(measurements) < 3, do: %__MODULE__{}

  defp setup_structure(measurements) do
    [first | [second | [third | left]]] = measurements
    last_measurement = first + second + third
    groups = {second + third, third, 0}

    %__MODULE__{
      measurement_groups: groups,
      last_measurement: last_measurement,
      left_measurements: left
    }
  end

  defp find_increments_count(structure = %{left_measurements: []}), do: structure

  defp find_increments_count(structure = %{left_measurements: [next_measurement | tail]}) do
    {one, two, three} = structure.measurement_groups
    new_groups = {one + next_measurement, two + next_measurement, three + next_measurement}
    new_measurement = elem(new_groups, structure.group_pointer)

    increments =
      if new_measurement > structure.last_measurement,
        do: structure.increments_counter + 1,
        else: structure.increments_counter

    new_pointer = if structure.group_pointer + 1 > 2, do: 0, else: structure.group_pointer + 1
    new_groups = put_elem(new_groups, structure.group_pointer, 0)

    new_structure = %{
      structure
      | increments_counter: increments,
        last_measurement: new_measurement,
        group_pointer: new_pointer,
        measurement_groups: new_groups,
        left_measurements: tail
    }

    find_increments_count(new_structure)
  end
end
