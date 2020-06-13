defmodule ExpensiveOperationWorker do
  def process([head | tail]) do
    operation_passed?(head) && process(tail)
  end

  def process([]), do: true

  defp operation_passed?(number) do
    IO.puts(number)
    rem(number, 2) != 0
  end
end

# 7 and 9 do not get evaluated
# because processing short-circuits at 6
IO.puts("Short circuit at 6")
expensive_operations = [1, 3, 5, 6, 7, 9]
ExpensiveOperationWorker.process(expensive_operations)

# processes all since none are even
IO.puts("\nAll processes run because no even number")
expensive_operations = [1, 3, 5, 7, 9, 11]
ExpensiveOperationWorker.process(expensive_operations)
