defmodule AdventOfCodeTest do
  use ExUnit.Case
  doctest AdventOfCode

  test "greets advent of code" do
    assert AdventOfCode.hello() == "advent of code 2021"
  end
end
