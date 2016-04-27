require 'securerandom'

class Coin
  attr_reader :side_showing

  def initialize
    @side_showing = 0
  end

  def flip
    @side_showing = SecureRandom.random_number 2
  end

  def == coin
    coin.side_showing == @side_showing
  end

  def to_s
    return "heads" if @side_showing == 1
    "tails"
  end
end


coin1 = Coin.new
coin2 = Coin.new

coin1.flip
coin2.flip

puts coin1
puts coin2

if coin1 == coin2
  puts "They are the same"
else
  puts "They are different"
end
