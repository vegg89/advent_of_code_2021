defmodule DayThreeTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DayThree.PartOne.execute("test/inputs/day_three_example.txt") == 198
  end

  test "calculate increases part 2(with example)" do
    assert AdventOfCode.DayThree.PartTwo.execute("test/inputs/day_three_example.txt") == 230
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DayThree.PartOne.execute("test/inputs/day_three.txt") == 2_498_354
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DayThree.PartTwo.execute("test/inputs/day_three.txt") == 3_277_956
  end
end
