defmodule Product do
  use GenServer

  def new(name, price) do
    GenServer.start_link(__MODULE__, [name, price])
  end

  def init(args) do
    [name, price] = args
    {:ok, %{name: name, price: price}}
  end

  def data(pid), do: GenServer.call(pid, :data)
  def handle_call(:data, _from, state), do: {:reply, state, state}

  def info(product) do
    "#{product[:name]}: $#{product[:price]}"
  end
end

defmodule ProductSupervisor do
  use DynamicSupervisor

  def start_link() do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def create_product(name, price) do
    spec = %{id: Product, start: {Product, :new, [name, price]}}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end

ProductSupervisor.start_link()

{:ok, coffee} = ProductSupervisor.create_product("coffee", 16.25)
{:ok, creamer} = ProductSupervisor.create_product("creamer", 3.5)
{:ok, sugar} = ProductSupervisor.create_product("sugar", 2.25)
{:ok, chocolate_syrup} = ProductSupervisor.create_product("chocolate syrup", 2.23)

IO.inspect Product.data(coffee)
IO.inspect Product.data(creamer)
IO.inspect Product.data(sugar)
IO.inspect Product.data(chocolate_syrup)
