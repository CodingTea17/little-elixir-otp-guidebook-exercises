defmodule KV.Worker do
  use GenServer

  @name KVW

  # Client

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: KVW])
  end

  def write(key, values) do
    GenServer.call(@name, {:write, key, values})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  # Server

  def init(:ok) do
    { :ok, %{} }
  end

  def handle_call({:write, key, values}, _from, kv_list) do
    kv_list = Map.put(kv_list, key, values)
    {:reply, "good", kv_list}
  end

  def handle_call({:read, key}, _from, kv_list) do
    {:reply, "here it is #{kv_list[key]}", kv_list}
  end

  # Helper

  # def write_to(key, values) do
  #   IO.puts(kv_list[key])
  # end
end
