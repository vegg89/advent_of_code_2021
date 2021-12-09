defmodule AdventOfCode.InputHelpers do
  def read_input(input_file, :as_integers) do
    input_file
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def read_input(input_file, :as_strings) do
    input_file
    |> File.read!()
    |> String.split("\n")
  end

  def read_input(input_file) do
    input_file
    |> File.read!()
  end
end
