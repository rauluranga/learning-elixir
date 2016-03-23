defmodule Hub do
  @username "rauluranga"
  
  "https://api.github.com/users/#{@username}/repos"
  |> HTTPoison.get!
  |> Map.get(:body)
  |> Poison.decode!
  |> Enum.each fn repo -> 
    def unquote(String.to_atom(repo["name"]))() do
       unquote(Macro.escape(repo))
     end
  end

  def go(repo) do
    url = apply(__MODULE__, repo, [])["html_url"]
    IO.puts "Launching browser to #{url}..."
    Systen.cmd("open", [url])
  end

end
