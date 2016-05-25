defmodule MathList do
  def sum_list(list), do: sum_list(list, 0)

  defp sum_list([], accumulator), do: accumulator

  defp sum_list([head | tail], accumulator) do
    sum_list(tail, accumulator + head)
  end
end

IO.puts MathList.sum_list([3,2,6])
