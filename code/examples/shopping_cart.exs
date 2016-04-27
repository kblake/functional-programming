defmodule Product do
  defstruct name: "undefined", price: 0.0
end

defmodule Cart do
  defstruct products: []

  def add_product(cart, product) do
    %Cart{cart | products: cart.products ++ List.wrap(product)}
  end

  def add_products(cart, products) do
    add_product(cart, products)
  end

  def contents(cart) do
    Enum.each cart.products, fn product ->
      IO.puts "#{product.name}: $#{product.price}"
    end
  end

  def sub_total(cart) do
    prices = Enum.map cart.products, fn product -> product.price end
    Enum.sum prices
  end
end


# TODO: as exercise
# give products uniq id
# enable quantity for product
# remove product from cart
# decrement quantity of product
# increase quantity of product
defmodule App do
  def run do
    coffee = %Product{name: "coffee", price: 16.25}
    creamer = %Product{name: "creamer", price: 3.5}
    sugar = %Product{name: "sugar", price: 2.25}
    chocolate_syrup = %Product{name: "chocolate syrup", price: 2.23}

    cart = %Cart{}
    cart = Cart.add_products(cart, [coffee, creamer, sugar, chocolate_syrup])

    Cart.contents(cart)
    IO.puts "Subtotal: $#{Cart.sub_total(cart)}"
  end
end

App.run
