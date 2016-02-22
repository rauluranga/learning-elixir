defmodule Playground do
  use Application
  
  defp pool_name() do
    :insta_batch
  end

  def start(_type, _args) do
    
    import Supervisor.Spec, warn: false

    IO.puts "____ Playground.start ____"

    poolboy_config = [
      {:name, {:local, pool_name()}},
      {:worker_module, Playground.InstaWorker},
      {:size, 0},
      {:max_overflow, 5}
    ]

    children = [
      :poolboy.child_spec(pool_name(), poolboy_config, []),
      worker(Playground.Server, [123])
    ]

    options = [
      strategy: :one_for_all,
      name: Playground.Supervisor
    ]

    Supervisor.start_link(children, options)

  end
end
