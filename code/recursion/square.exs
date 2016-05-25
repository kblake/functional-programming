defmodule ListStuff do
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]
end

ListStuff.square []
ListStuff.square [4,5,6]
