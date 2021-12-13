defmodule DaySixTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases part 1(with example)" do
    assert AdventOfCode.DaySix.PartOne.execute("test/inputs/day_six_example.txt", 80) == 5934
  end

  test "calculate increases part 2(with example)" do
    assert AdventOfCode.DaySix.PartTwo.execute("test/inputs/day_six_example.txt", 256) ==
             26_984_457_539
  end

  test "calculate increases part 1" do
    assert AdventOfCode.DaySix.PartOne.execute("test/inputs/day_six.txt", 80) == 350_917
  end

  test "calculate increases part 2" do
    assert AdventOfCode.DaySix.PartTwo.execute("test/inputs/day_six.txt", 256) ==
             1_592_918_715_629
  end
end
