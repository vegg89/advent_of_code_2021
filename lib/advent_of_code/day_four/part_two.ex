defmodule AdventOfCode.DayFour.PartTwo do
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
    {number, [winning_board | _]} = find_last_winner(numbers, boards, {nil, nil})

    unmarked =
      Stream.filter(winning_board, & &1)
      |> Stream.map(&String.to_integer/1)
      |> Enum.sum()

    unmarked * String.to_integer(number)
  end

  defp find_last_winner([], _boards, last_winners), do: last_winners

  defp find_last_winner([current_number | remaining], boards, {last_winner_number, last_winners}) do
    new_boards = Stream.map(boards, fn board -> add_number(current_number, board) end)
    {winner_boards, rem_boards} = find_winners(new_boards)
    new_winners = if length(winner_boards) > 0, do: winner_boards, else: last_winners
    winner_number = if length(winner_boards) > 0, do: current_number, else: last_winner_number
    find_last_winner(remaining, rem_boards, {winner_number, new_winners})
  end

  defp add_number(number, board) do
    Enum.map(board, fn board_num -> if board_num == number, do: nil, else: board_num end)
  end

  defp find_winners(boards) do
    Enum.reduce(boards, {[], []}, fn board, {winners, rem} ->
      if win?(board), do: {[board | winners], rem}, else: {winners, [board | rem]}
    end)
  end

  defp win?(board) do
    Enum.any?(@lines, fn line ->
      Enum.all?(line, fn index ->
        is_nil(Enum.at(board, index))
      end)
    end)
  end
end
