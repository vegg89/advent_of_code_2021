defmodule DayFourTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DayFour.PartOne.execute("test/inputs/day_four_example.txt") == 4512
  end

  test "calculate increases part 2(with example)" do
    assert AdventOfCode.DayFour.PartTwo.execute("test/inputs/day_four_example.txt") == 1924
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DayFour.PartOne.execute("test/inputs/day_four.txt") == 38594
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DayFour.PartTwo.execute("test/inputs/day_four.txt") == 21184
  end
end
