defmodule Forever do
  def add_no_tail(number) do
    another_number = 10_000
    another_number + add_no_tail(number)
  end

  def add_tail_recursive(number) do
    another_number = 10_000
    add_tail_recursive(number + another_number)
  end
end

# Forever.add_no_tail(1)
Forever.add_tail_recursive(1)
