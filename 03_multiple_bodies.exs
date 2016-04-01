# Multiple bodied function

arithmetic = fn
  {:add, num1, num2}      -> num1 + num2
  {:subtract, 10, 5}      -> 0
  {:subtract, num1, num2} -> num1 - num2
end

# pattern matches arguments to call correct body
IO.puts arithmetic.({:add, 10, 5})
IO.puts arithmetic.({:subtract, 10, 5})
IO.puts arithmetic.({:subtract, 78, 8})


# Fizzbuzz with NO CONDITIONALS
# For the numbers 1 - 100, print Fizz if it is divisible by 3, Buzz if it is divisible by 5, FizzBuzz if divisible by 3 and 5, and just print the number if none of those are true.
whichfizz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, n) -> n
end

fizzbuzz = fn (n) ->
  whichfizz.(rem(n, 3), rem(n, 5), n)
end

IO.inspect Enum.map(1..100, fizzbuzz)


# In Ruby
# whichfizz = ->(a, b, n) {
#   if (a == 0 && b == 0)
#     "FizzBuzz"
#   elsif (a == 0)
#     "Fizz"
#   elsif (b == 0)
#     "Buzz"
#   else
#     n.to_s
#   end
# }

# fizzbuzz = ->(n) {
#   whichfizz.(n % 3, n % 5, n)
# }

# p (1..100).map(&fizzbuzz)
