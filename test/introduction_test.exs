defmodule IntroductionTest do
  use ExUnit.Case
  doctest Introduction

  describe "binary search" do
    test "finds item in small tuple" do
      assert Introduction.binary_search({1, 2, 3}, 1) == 0
    end
    test "returns nil if item is not present" do
      assert Introduction.binary_search({1,2,3}, 4) == nil
    end

    test "finds item in huge list" do
      tuple = 1..1_000_000 |> Enum.into([]) |> List.to_tuple()

      1..1_000_000_000 |> Enum.into(:array.new())
      |> IO.inspect()

      assert Introduction.binary_search(tuple, 1_000_000) == 999_999
    end
  end
end
