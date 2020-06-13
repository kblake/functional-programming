defmodule FunCache do
  def init do
    %{}
  end

  def add(cache, key, value) do
    Map.put(cache, key, value)
  end

  def get(cache, key) do
    cache[key]
  end

  def remove(cache, key) do
    Map.delete(cache, key)
  end
end

cache = FunCache.init()
IO.inspect(cache)

cache = FunCache.add(cache, "foo", "bar")
cache = FunCache.add(cache, "baz", "lala")
IO.inspect(cache)

IO.puts(FunCache.get(cache, "foo"))

cache = FunCache.remove(cache, "foo")
IO.inspect(cache)
