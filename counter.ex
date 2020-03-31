defmodule Counter do
  use GenServer

  def start_link(state, opts) do
    IO.puts "--- Counter.state_link(#{inspect state}, #{inspect opts}) called ---"
    GenServer.start_link(__MODULE__, state, opts) # __MODULE__ で自身のモジュール名(Counter)を参照できる
  end

  def init(state) do
    IO.puts "--- init(#{inspect state}) called ---"
    {:ok, state}
  end

  def handle_call(:up, from, state) do
    IO.puts "--- handle_call(:up, #{inspect from}, #{inspect state}) called ---"
    state = state + 1
    {:reply, "result: count up to #{inspect state}", state}
  end

  def handle_call(:down, from, state) do
    IO.puts "--- handle_call(:down, #{inspect from}, #{inspect state}) called ---"
    state = state - 1
    {:reply, "result: count up to #{inspect state}", state}
  end

  def handle_cast(:up, state) do
    IO.puts "--- handle_cast(:up, #{inspect state}) called ---"
    state = state + 1
    IO.puts "--- state -> #{state} ---"
    {:noreply, state}
  end

  def handle_cast(:down, state) do
    IO.puts "--- handle_cast(:down, #{inspect state}) called ---"
    state = state - 1
    IO.puts "--- state -> #{state} ---"
    {:noreply, state}
  end
end
