x = 1

{x, y} = {1, 2}

case {1, 2} do
  {2, 3} ->
    "not match"

  {1, 2} ->
    "match"
end

case {:ok, 2} do
  {:ok, result} when result > 5 ->
    "match with access to #{result} and result > 5"

  {:ok, result} ->
    "match with access to #{result} and result not > 5"

  {:error, message} ->
    IO.puts(message)
end

def zero?(x) do
  if !is_integer(x) do
    raise "NaN"
  end

  if x == 0 do
    true
  else
    false
  end
end

def zero?(0), do: true
def zero?(x) when is_integer(x), do: false
