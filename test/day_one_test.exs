defmodule DayOneTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DayOne.PartOne.execute("test/inputs/day_one_example.txt") == 7
  end

  test "calculate increases part 2(with example)" do
    assert AdventOfCode.DayOne.PartTwo.execute("test/inputs/day_one_example.txt") == 5
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DayOne.PartOne.execute("test/inputs/day_one.txt") == 1288
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DayOne.PartTwo.execute("test/inputs/day_one.txt") == 1311
  end
end
