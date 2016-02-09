defmodule Playground.MyList do
  
  def sum([]), do: 0
  def sum([head|tail]) do
   head + sum(tail) 
  end

  def map([], func), do: []
  def map([head|tail], func) do
      [func.(head) | map(tail, func)]
  end
  
end
