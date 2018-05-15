defmodule KV.Worker do
  use GenServer

  @name KVW

  # Client

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: KVW])
  end

  # Server

  def init(:ok) do
    { :ok, %{} }
  end

  # Helper
end
