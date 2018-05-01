# Purpose: Flattens, reverses, and squares a list
# Accepts: a list... e.g MyMod.transform([1,[[2],3]])

defmodule MyMod do
  def transform([]), do: []

  def transform([head | tail]) do
    transform(tail) ++ transform(head)
  end

  def transform(head) do
    [head * head]
  end
end
