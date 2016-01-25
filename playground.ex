defmodule Playground do
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n) when n > 1 do
    fib(n-2) + fib(n-1)  
  end
  
  def sum([]), do: 0
  def sum([head|tail]) do
   head + sum(tail) 
  end

  def map([], func), do: []
  def map([head|tail], func) do
      [func.(head) | map(tail, func)]
  end

  defp calc(0,0,_), do: "FizzBuzz"
  defp calc(0,_,_), do: "Fizz"
  defp calc(_,0,_), do: "Buzz"
  defp calc(_,_,n), do: n

  def print(n) do
    calc(rem(n,3),rem(n,5),n)
  end

end
