defmodule SimpleCanTest do
  use ExUnit.Case
  doctest SimpleCan

  test "greets the world" do
    assert SimpleCan.hello() == :world
  end
end
