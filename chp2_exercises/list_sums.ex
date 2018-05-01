
defmodule MyMod do
  def list_sum([head | tail], acc) do
    list_sum(tail, acc + head)
  end

  def list_sum([], acc) do
    acc
  end
end
