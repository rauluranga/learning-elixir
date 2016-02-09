defmodule Playground.Fibonacci do
  
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n) when n > 1 do
    fib(n-2) + fib(n-1)  
  end

end
