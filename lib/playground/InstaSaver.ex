defmodule Playground.InstaWorker do
	
	def saveImageFromUrl(url) do
	  url 
	    |> parseInstagramURL
	    |> saveInstagramImage
	end

	def parseInstagramURL(url) do
      res = HTTPoison.get!(url)
	  Floki.find(res.body, "[property='og:image']") |> Floki.attribute("content") |> List.first
	end

	def saveInstagramImage(image_path) do
      image_req = HTTPoison.get!(image_path)
	  File.write!("public/images/#{Path.basename(image_path)}", image_req.body)
	end
end