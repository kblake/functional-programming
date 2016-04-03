times2 = fn x -> x * 2 end
times3 = fn x -> x * 3 end
times4 = fn x -> x * 4 end

perform = fn(fun, value) -> fun.(value) end

IO.puts perform.(times2, 5)
IO.puts perform.(times3, 5)
IO.puts perform.(times4, 5)

nums = [10,39,31,83]

IO.inspect Enum.map nums, times2
IO.inspect Enum.map nums, times3
IO.inspect Enum.map nums, times4
