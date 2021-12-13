defmodule DayFiveTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DayFive.PartOne.execute("test/inputs/day_five_example.txt") == 5
  end

  test "calculate increases part 2(with example)" do
    assert AdventOfCode.DayFive.PartTwo.execute("test/inputs/day_five_example.txt") == 12
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DayFive.PartOne.execute("test/inputs/day_five.txt") == 7297
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DayFive.PartTwo.execute("test/inputs/day_five.txt") == 21038
  end
end
