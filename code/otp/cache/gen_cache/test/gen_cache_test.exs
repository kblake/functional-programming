defmodule GenCacheTest do
  use ExUnit.Case
  doctest GenCache

  test "cache gets initialized" do
    GenCache.start_link()
    assert GenCache.contents() == %{}
  end

  test "add to cache" do
    GenCache.start_link()
    GenCache.add("1234", "Karmen Blake")
    assert GenCache.contents() == %{"1234" => "Karmen Blake"}
  end

  test "get a value with given key" do
    GenCache.start_link()
    GenCache.add("1234", "Karmen Blake")
    assert GenCache.get("1234") == "Karmen Blake"
  end

  test "remove a value" do
    GenCache.start_link()
    GenCache.add("1234", "Karmen Blake")
    GenCache.remove("1234")
    assert GenCache.contents() == %{}
  end
end
