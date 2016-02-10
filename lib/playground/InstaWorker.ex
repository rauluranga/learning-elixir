defmodule Playground.InstaWorker do
  use GenServer

  def start_link([]) do
    :gen_server.start_link(__MODULE__, [], [])
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(data, from, state) do
    result = Playground.InstaSaver.saveImageFromUrl data
    IO.puts "Worker Reports: #{data} = #{result}"
    {:reply, [result], state}
  end

  def saveImageFromUrl(pid, value) do
    :gen_server.call(pid, value)
  end
end