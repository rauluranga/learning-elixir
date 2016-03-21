defmodule Playground.InstaSaver do
	
	def saveImageFromUrl(url) do
	  url 
	    |> parseInstagramURL
	    |> saveInstagramImage
	end

	def parseInstagramURL(url) do
      
      res = HTTPoison.get!(url)
	  
	  Floki.find(res.body, "[property='og:image']") 
	    |> Floki.attribute("content") 
	    |> List.first

	end

	def saveInstagramImage(image_path) do
      image_req = HTTPoison.get!(image_path)
      image_name = image_path 
                     |> String.split("?")
                     |> List.first
	  File.write!("public/images/#{Path.basename(image_name)}", image_req.body)
	end
end