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

defmodule Cart do
  use GenServer

  # API
  def new() do
    GenServer.start_link(__MODULE__, :ok, name: :cart)
  end

  def add_product(product) do
    GenServer.cast(:cart, {:add_product, product})
  end

  def contents, do: GenServer.call(:cart, :contents)
  def sub_total, do: GenServer.call(:cart, :sub_total)

  # Callbacks
  def init(_args) do
    {:ok, []}
  end

  def handle_cast({:add_product, product}, products) do
    products = [product | products]
    {:noreply, products}
  end

  def handle_call(:contents, _from, products) do
    for pid <- products do
      pid
      |> Product.data
      |> Product.info
      |> IO.puts
    end

    {:reply, products, products}
  end

  def handle_call(:sub_total, _from, products) do
    sum = products
    |> Enum.map(& Product.data(&1))
    |> Enum.map(& &1.price)
    |> Enum.sum

    {:reply, sum, products}
  end
end

{:ok, coffee} = Product.new("coffee", 16.25)
{:ok, creamer} = Product.new("creamer", 3.5)
{:ok, sugar} = Product.new("sugar", 2.25)
{:ok, chocolate_syrup} = Product.new("chocolate syrup", 2.23)

Cart.new()
Cart.add_product(coffee)
Cart.add_product(creamer)
Cart.add_product(sugar)
Cart.add_product(chocolate_syrup)

Cart.contents()
IO.puts "---------------------"
IO.puts "Subtotal: $#{Cart.sub_total()}"