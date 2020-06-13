# Curry is the process of taking a function that has an arity (or number of arguements) of N
# and turning it into a sequence of functions that have an arity of 1

add = fn x ->
  fn y ->
    x + y
  end
end

# Tell the function to add 2 to the arguement
add2 = add.(2)

# Add 2 to 4
add2.(4)
# => 6
