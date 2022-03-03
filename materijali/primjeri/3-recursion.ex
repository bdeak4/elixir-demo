def sum_list([head | tail], accumulator) do
  sum_list(tail, head + accumulator)
end

def sum_list([], accumulator), do: accumulator

Enum.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
