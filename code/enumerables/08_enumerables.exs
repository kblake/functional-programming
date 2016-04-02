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

# More fun
# http://elixir-lang.org/docs/stable/elixir/Enum.html
:ok
