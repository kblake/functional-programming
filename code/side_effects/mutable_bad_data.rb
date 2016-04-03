class BadBank
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def add_money(money)
    @amount += money
    puts "Adding money #{money} amount $#{amount}"
    sleep 0.5
  end

  def windfall!
    @amount += 10 if amount >= 100
    puts "Windfall $#{amount}"
    sleep 0.5
    amount
  end
end

bank = BadBank.new(10)
puts "Karmen initial bank amount $#{bank.amount}"
t1 = Thread.new { 8.times { bank.add_money(10) } }
t2 = Thread.new { 8.times { bank.add_money(10) } }
t3 = Thread.new { 8.times { bank.windfall! } }

t1.join
t2.join
t3.join
