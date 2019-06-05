defmodule GenCache do
  use GenServer
  alias GenCache.FunCache

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: :gen_cache)
  end

  def contents do
    GenServer.call(:gen_cache, :contents)  
  end

  def add(id, name) do
    GenServer.cast(:gen_cache, {:add, id, name})
  end

  def get(id) do
    GenServer.call(:gen_cache, {:get, id})  
  end

  def remove(id) do
    GenServer.cast(:gen_cache, {:remove, id})  
  end

  def init(_args) do
    {:ok, FunCache.init()}
  end

  def handle_call(:contents, _from, cache) do
    {:reply, cache, cache}
  end

  def handle_call({:get, id}, _from, cache) do
    {:reply, FunCache.get(cache, id), cache}
  end

  def handle_cast({:remove, id}, cache) do
    updated_cache = FunCache.remove(cache, id)
    {:noreply, updated_cache}
  end

  def handle_cast({:add, id, name}, cache) do
    updated_cache = FunCache.add(cache, id, name)
    {:noreply, updated_cache}
  end
end
