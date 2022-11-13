defmodule Cli.ParseTest do
  use ExUnit.Case
  alias Cli.Parse

  test "plus with float gets parsed successfully" do
    input = "+ 2.0"
    assert Parse.parse(input) == {:ok, :plus, 2.0}
  end

  test "plus with integer is unsuccessful" do
    input = "+ 2"
    assert Parse.parse(input) == {:error, "Invalid input"}
  end

  test "square_root(#) gets parsed successfully" do
    input = "#"
    assert Parse.parse(input) == {:ok, :square_root}
  end

  test "square_root(#) with value is unsuccessful" do
    input = "# 2.0"
    assert Parse.parse(input) == {:error, "Invalid input"}
  end
end
