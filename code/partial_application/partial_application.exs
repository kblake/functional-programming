# partial application example

# regular function with arity of 2
sum = fn x, y -> x + y end
IO.puts sum.(5,6)

# same function, partially applied
sum = fn x ->
        fn y ->
          x + y
        end
      end

IO.puts sum.(18).(4)

add_five_to = sum.(5)

IO.puts add_five_to.(10)
IO.puts add_five_to.(3)
