defmodule IceCreamBotTest do
  use ExUnit.Case
  doctest IceCreamBot

  test "greets the world" do
    assert IceCreamBot.hello() == :world
  end
end
