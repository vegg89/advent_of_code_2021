defmodule AdventOfCode.DayFour.PartOne do
  @moduledoc """
  Documentation for `DayOne.PartOne`.
  """
  import AdventOfCode.InputHelpers

  @lines [
    [0, 1, 2, 3, 4],
    [5, 6, 7, 8, 9],
    [10, 11, 12, 13, 14],
    [15, 16, 17, 18, 19],
    [20, 21, 22, 23, 24],
    [0, 5, 10, 15, 20],
    [1, 6, 11, 16, 21],
    [2, 7, 12, 17, 22],
    [3, 8, 13, 18, 23],
    [4, 9, 14, 19, 24]
  ]

  def execute(input_file) do
    [draw_numbers | boards] =
      input_file
      |> read_input()
      |> String.split("\n\n")

    numbers = String.split(draw_numbers, ",")

    boards =
      Enum.map(boards, fn board ->
        Regex.scan(~r/(\d{1,2})/, board, capture: :all_but_first)
        |> List.flatten()
      end)

    begin_game(numbers, boards)
  end

  defp begin_game(numbers, boards) do
    {number, winning_board} = find_winner(numbers, boards)

    unmarked =
      Stream.filter(winning_board, & &1)
      |> Stream.map(&String.to_integer/1)
      |> Enum.sum()

    unmarked * String.to_integer(number)
  end

  defp find_winner([current_number | remaining], boards) do
    new_boards = Enum.map(boards, fn board -> add_number(current_number, board) end)
    winner = Enum.find(new_boards, &win?/1)

    if winner, do: {current_number, winner}, else: find_winner(remaining, new_boards)
  end

  defp add_number(number, board) do
    Enum.map(board, fn board_num -> if board_num == number, do: nil, else: board_num end)
  end

  defp win?(board) do
    Enum.any?(@lines, fn line ->
      Enum.all?(line, fn index ->
        is_nil(Enum.at(board, index))
      end)
    end)
  end
end
