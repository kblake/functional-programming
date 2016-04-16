# Don't have to write another for loop again :)

# map
nums = 1..10
IO.inspect Enum.map(nums, &(&1 * 2))
# IO.inspect nums |> Enum.map(&(&1 * 2))

# reduce
IO.inspect Enum.reduce(nums, fn(num, acc) -> num + acc end)
# IO.inspect nums |> Enum.reduce(fn(num, acc) -> num + acc end)

# filter
# IO.inspect Enum.filter(nums, fn(num) -> rem(num, 2) == 0 end)
IO.inspect Enum.filter(nums, &(rem(&1,2) == 0))
# IO.inspect nums |> Enum.filter &(rem(&1,2) == 0)





require Integer

# combine via piping
# first argument of function is the result of the previous call
nums = 1..100
nums
|> Enum.map(&(&1 * 5))                        # muliply all nums by 5
|> Enum.filter(&Integer.is_even/1)            # filter for those that are even
|> Enum.reduce(fn num, acc -> num + acc end)  # reduce by summing



# loads 10 million integers up front then takes 5
Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)


# Streams and lazy loading
# take five up front and finish. no more processing
Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)



# More fun
# http://elixir-lang.org/docs/stable/elixir/Enum.html
:ok
