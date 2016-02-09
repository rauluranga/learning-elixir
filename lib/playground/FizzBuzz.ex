defmodule Playground.FizzBuzz do

  defp calc(0,0,_), do: "FizzBuzz"
  defp calc(0,_,_), do: "Fizz"
  defp calc(_,0,_), do: "Buzz"
  defp calc(_,_,n), do: n

  def print(n) do
    calc(rem(n,3),rem(n,5),n)
  end

end
