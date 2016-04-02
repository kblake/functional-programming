# Doing the maths:
# (value2 * (value1 + value3)) + value1 * value2
# if value1 = 4, value2 = 2, value3 = 0
# then result should be 16

# (2 * (4 + 0)) + 4 * 2
# 8 + 8
# 16

class Value
  attr_reader :result

  def initialize(initial_value)
    @result = initial_value
  end

  def add(other)
    @result += other.result
    self
  end

  def multiply(other)
    @result *= other.result
    self
  end
end

val1 = Value.new(4)
val2 = Value.new(2)
val3 = Value.new(0)

result = val1.add(val3).multiply(val2)
         .add(val1.multiply(val2))
         .result

puts result # ==> 32, incorrect answer
