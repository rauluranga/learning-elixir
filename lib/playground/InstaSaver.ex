defmodule Playground.InstaSaver do

  import Playground.InstaWorker, only: [saveImageFromUrl: 1]

  def parseFile(file) do
    File.stream!(file, [:utf8])
      |> Enum.map(fn(line) ->
          saveImageFromUrl line
         end)
  end
  
  def run do
    IO.puts inspect :timer.tc(Playground.InstaSaver, :parseFile, ["public/data.txt"])
  end
end

