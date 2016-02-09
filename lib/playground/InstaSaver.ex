defmodule Playground.InstaSaver do
  def parseFile(file) do
    File.stream!(file, [:utf8])
      |> Enum.map(fn(line) ->
          res = HTTPoison.get!(line)
          Floki.find(res.body, "[property='og:image']") |> Floki.attribute("content") |> List.first
         end)
      |> Enum.map(fn(image_url) ->
          image_req = HTTPoison.get!(image_url)
          File.write!("public/images/#{Path.basename(image_url)}", image_req.body)
         end)
  end

end

