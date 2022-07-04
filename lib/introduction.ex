defmodule Introduction do
  @moduledoc """
  Chapter 1: introduction
  """

  @doc """
  Perform a binary search on a tuple containing ordered integers.
  Returns the position of the item, or nil if the item is not found.

  Initially, i used a list here instead of a tuple. However, Elixir lists are linked lists,
  so random access requires O(n) time. Tuples support random access in O(1).

  Time complexity: O(log n)
  """
  @spec binary_search(tuple(), any()) :: any() | nil
  def binary_search(tuple, item) do
    do_binary_search(tuple, item, 0, tuple_size(tuple) - 1)
  end

  defp do_binary_search(tuple, item, low, high) do
    middle = div(low + high, 2)
    guess = elem(tuple, middle)

    cond do
      guess == item -> middle
      low == high -> nil
      guess > item -> do_binary_search(tuple, item, low, middle - 1)
      guess < item -> do_binary_search(tuple, item, middle + 1, high)
    end
  end
end
