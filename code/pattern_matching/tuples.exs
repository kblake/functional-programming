{:ok, value} = {:ok, 1000}
IO.puts value

{:error, message} = {:error, "Could not perform task!"}
IO.puts message

# does not match
{:foo, value} = {:bar, "nope"}
IO.puts value
