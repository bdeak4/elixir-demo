IO.puts(Math.sum_list([1, 2, 3], 0))

[1, 2, 3]
|> Math.sum_list(0)
|> IO.puts()

list =
  [1, [2], 3]
  |> List.flatten()
  |> Enum.map(fn x -> x * 2 end)

def get_resp(path) do
  path
  |> get_api_url()
  |> HTTPoison.get!()
  |> Map.get(:body)
  |> IO.inspect()
  |> Jason.decode!()
end

defmodule Tools do
  def grep(file_path, regex) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.filter(fn line -> Regex.match?(regex, line) end)
  end
end
