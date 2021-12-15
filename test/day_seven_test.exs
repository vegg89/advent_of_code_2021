defmodule DaySevenTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DaySeven.PartOne.execute("test/inputs/day_seven_example.txt") == 37
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DaySeven.PartOne.execute("test/inputs/day_seven.txt") == 333755
  end
end
