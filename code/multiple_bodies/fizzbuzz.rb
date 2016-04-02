# Fizzbuzz
# For the numbers 1 - 100, print Fizz if it is divisible by 3, Buzz if it is divisible by 5, FizzBuzz if divisible by 3 and 5, and just print the number if none of those are true.

whichfizz = -> (a, b, n) {
  if a == 0 && b == 0
    'FizzBuzz'
  elsif a == 0
    'Fizz'
  elsif b == 0
    'Buzz'
  else
    n
  end
}

fizzbuzz = ->(n) {
  whichfizz.(n % 3, n % 5, n)
}

p (1..100).map(&fizzbuzz)
