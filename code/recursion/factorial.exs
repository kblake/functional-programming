# Factorials in math are written like 6! and are the result of 6 * 5 * 4 * 3 * 2 * 1.

defmodule FactorialNoTail do
  def factorial(0), do: 1

  def factorial(n) do
    n * factorial(n - 1)
  end
end

IO.puts(FactorialNoTail.factorial(10))

defmodule FactorialTailRecursive do
  def factorial(n), do: factorial(n, 1)

  defp factorial(0, accumulator), do: accumulator

  defp factorial(n, accumulator) do
    factorial(n - 1, accumulator * n)
  end
end

IO.puts(FactorialTailRecursive.factorial(10))
