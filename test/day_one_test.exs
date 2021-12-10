defmodule DayOneTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1" do
    assert AdventOfCode.DayOne.PartOne.execute("test/inputs/day_one.txt") == 1288
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DayOne.PartTwo.execute("test/inputs/day_one.txt") == 1311
  end
end
