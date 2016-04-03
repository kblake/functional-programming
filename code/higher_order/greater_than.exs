greather_than = fn x -> x > 10 end

IO.puts greather_than.(11)
IO.puts greather_than.(8)

IO.inspect Enum.map 1..100, greather_than
