name = %{first: "jane", last: "doe"}

pure = fn name ->
  # Map.merge does not alter original
  Map.merge(name, %{first: "sally"})
end

new_name = pure.(name)

IO.puts("Pure function - original is not altered")
IO.inspect(name)
IO.inspect(new_name)

:ok
