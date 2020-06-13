times = fn x -> fn y -> y * x end end

times2 = times.(2)
times3 = times.(3)
times4 = times.(4)

perform = fn fun, value -> fun.(value) end

IO.puts(perform.(times2, 5))
IO.puts(perform.(times3, 5))
IO.puts(perform.(times4, 5))

nums = [10, 39, 31, 83]

IO.inspect(Enum.map(nums, times2))
IO.inspect(Enum.map(nums, times3))
IO.inspect(Enum.map(nums, times4))
