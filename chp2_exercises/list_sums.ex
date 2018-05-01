# Purpose: Sums a list (I cheated by using sum/2...will revisit to make a sum/1)
# Accepts: a list and a start value...e.g. MyMod.list_sum([1,2,3], 0)

defmodule MyMod do
  def list_sum([head | tail], acc) do
    list_sum(tail, acc + head)
  end

  def list_sum([], acc) do
    acc
  end
end
