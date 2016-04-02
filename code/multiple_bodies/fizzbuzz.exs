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
