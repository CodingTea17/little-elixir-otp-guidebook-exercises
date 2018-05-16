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

  def exist?(key) do
    GenServer.call(@name, {:exist, key})
  end

  def delete(key) do
    GenServer.cast(@name, {:delete, key})
  end

  def clear() do
    GenServer.cast(@name, {:clear})
  end

  def stop() do
    GenServer.cast(@name, :stop)
  end

  # Server

  def init(:ok) do
    { :ok, %{} }
  end

  def handle_call({:write, key, values}, _from, kv_list) do
    new_kv_list = Map.put(kv_list, key, values)
    {:reply, :ok, new_kv_list}
  end

  def handle_call({:read, key}, _from, kv_list) do
    {:reply, kv_list[key], kv_list}
  end

  def handle_call({:exist, key}, _from, kv_list) do
    case Map.has_key?(kv_list, key) do
      true ->
        {:reply, true, kv_list}
      false ->
        {:reply, false, kv_list}
    end
  end

  def handle_cast({:delete, key}, kv_list) do
    new_kv_list = Map.delete(kv_list, key)
    {:noreply, new_kv_list}
  end

  def handle_cast({:clear}, _kv_list) do
    {:noreply, %{}}
  end

  def handle_cast(:stop, kv_list) do
    {:stop, :normal, kv_list}
  end

  def terminate(reason, stats) do
    IO.puts("Server is being terminated due to #{inspect reason}")
      inspect(stats)
    :ok
  end

  def handle_info(msg, stats) do
    IO.puts("Msg received #{inspect(msg)}")
    {:noreply, stats}
  end

  # Helper

end
