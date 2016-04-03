# Doing the maths:
# (value2 * (value1 + value3)) + value1 * value2
# if value1 = 4, value2 = 2, value3 = 0
# then result should be 16

# (2 * (4 + 0)) + 4 * 2
# 8 + 8
# 16

defmodule FunctionalMath do
  def add(num1, num2) do
    num1 + num2
  end

  def multiply(num1, num2) do
    num1 * num2
  end
end

result = FunctionalMath.add(
  FunctionalMath.multiply(value2, FunctionalMath.add(value1, value3)),
  FunctionalMath.multiply(value1, value2)
)

IO.puts result # ==> 16, correct answer
