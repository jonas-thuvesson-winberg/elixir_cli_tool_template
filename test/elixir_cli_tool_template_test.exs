defmodule ElixirCliToolTemplateTest do
  use ExUnit.Case
  doctest ElixirCliToolTemplate

  test "greets the world" do
    assert ElixirCliToolTemplate.hello() == :world
  end
end
