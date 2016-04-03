# Doing the maths:
# (value2 * (value1 + value3)) + value1 * value2
# if value1 = 4, value2 = 2, value3 = 0
# then result should be 16

# (2 * (4 + 0)) + 4 * 2
# 8 + 8
# 16

add = fn (num1, num2) -> num1 + num2 end
multiply = fn (num1, num2) -> num1 * num2 end

value1 = 4
value2 = 2
value3 = 0

result = add.(
  multiply.(value2, add.(value1, value3)),
  multiply.(value1, value2)
)

IO.puts result
