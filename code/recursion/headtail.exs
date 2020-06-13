[a, b, c] = [1, 2, 3]

IO.puts(a)
IO.puts(b)
IO.puts(c)

# head - first element
# tail - is the rest

[head | tail] = [1, 2, 3, 4]
IO.puts(head)
IO.inspect(tail)

[head | tail] = tail
IO.puts(head)
IO.inspect(tail)

[head | tail] = tail
IO.puts(head)
IO.inspect(tail)
