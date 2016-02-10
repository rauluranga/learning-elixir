defmodule Playground.InstaBatch do

  def parseFile(file) do
    File.stream!(file, [:utf8])
      |> Enum.map(fn(line) ->
          Playground.InstaSaver.saveImageFromUrl line
         end)
  end
  
  def run do
    IO.puts inspect :timer.tc(Playground.InstaBatch, :parseFile, ["public/data.txt"])
  end

  def run_parallel do
    IO.puts inspect :timer.tc(Playground.InstaBatch, :parallel_save, [:insta_batch, "public/data.txt"])
  end

  def basic_save(pool, instagram_url) do
    pool_save(pool, instagram_url)
  end

  def parallel_save(pool, file) do
    File.stream!(file, [:utf8])
      |> Enum.map(fn(line) ->
          spawn( fn() -> pool_save(pool, line) end )
         end)
  end

  defp pool_save(pool, line) do
    :poolboy.transaction(pool, fn(pid) -> 
        Playground.InstaWorker.saveImageFromUrl(pid, line)
      end)
  end

end

