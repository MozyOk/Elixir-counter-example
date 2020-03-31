defmodule Counter do
  use GenServer

  def init(state) do
    IO.puts "--- init(#{inspect state}) called ---"
    {:ok, state}
  end
end
