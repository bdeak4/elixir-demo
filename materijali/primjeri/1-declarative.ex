def fact(1), do: 1
def fact(n) when n > 1, do: n * fact(n - 1)
