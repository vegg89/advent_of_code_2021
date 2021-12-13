defmodule DayTwoTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DayTwo.PartOne.execute("test/inputs/day_two_example.txt") == 150
  end

  test "calculate increases part 2(with example)" do
    assert AdventOfCode.DayTwo.PartTwo.execute("test/inputs/day_two_example.txt") == 900
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DayTwo.PartOne.execute("test/inputs/day_two.txt") == 1_924_923
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DayTwo.PartTwo.execute("test/inputs/day_two.txt") == 1_982_495_697
  end
end
