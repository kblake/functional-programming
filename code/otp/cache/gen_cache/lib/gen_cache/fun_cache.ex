defmodule GenCache.FunCache do
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
