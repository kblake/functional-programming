class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name  = name
    @price = price
  end
end

class Cart
  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def add_products(products)
    @products += products
  end

  def contents
    @products.each do |product| 
      puts "#{product.name}: $#{product.price}"
    end
  end

  def sub_total
    @products.reduce(0) do |sum, product|
      product.price + sum
    end
  end
end


coffee = Product.new("coffee", 16.25)
creamer = Product.new("creamer", 3.5)
sugar = Product.new("sugar", 2.25)
chocolate_syrup = Product.new("chocolate syrup", 2.23)

cart = Cart.new
cart.add_products([coffee, creamer, sugar, chocolate_syrup])
cart.contents
puts "Subtotal: $#{cart.sub_total}"
