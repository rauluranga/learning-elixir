defmodule Playground.InstaBatch do

  def parseFile(file) do
    File.stream!(file, [:utf8])
      |> Enum.map(fn(line) ->
          Playground.InstaSaver.saveImageFromUrl line
         end)
  end

  def parseFile_parallel(file) do
    File.stream!(file, [:utf8])
      |> Enum.map(fn(line) ->
          spawn( fn() -> pool_save(line) end )
         end)
  end
  
  def run do
    IO.puts inspect :timer.tc(Playground.InstaBatch, :parseFile, ["public/data.txt"])
  end

  def run_parallel do
    IO.puts inspect :timer.tc(Playground.InstaBatch, :parseFile_parallel, ["public/data.txt"])
  end  

  defp pool_save(line) do
    :poolboy.transaction(:insta_batch, fn(pid) -> 
        Playground.InstaWorker.saveImageFromUrl(pid, line)
      end)
  end

end

