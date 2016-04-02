arithmetic = fn
  {:add, num1, num2}      -> num1 + num2
  {:subtract, 10, 5}      -> 0
  {:subtract, num1, num2} -> num1 - num2
end

# pattern matches arguments to call correct body
IO.puts arithmetic.({:add, 10, 5})
IO.puts arithmetic.({:subtract, 10, 5})
IO.puts arithmetic.({:subtract, 78, 8})
