defmodule DayOneTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate increases" do
    # Benchee.run(
    #   %{
    #   "day1.part1" => fn -> AdventOfCode.DayOne.PartOne.execute("test/inputs/day_one.txt", 2020) end
    #   }
    # )
    assert AdventOfCode.DayOne.PartOne.execute("test/inputs/day_one.txt") == 1288
  end
end
