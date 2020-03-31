defmodule SampleFunc do
  def hello2(person) do
    IO.puts "Hello #{person}. My pid is #{inspect self()}"
    receive do
      message ->
        IO.puts "Message is #{message}"
        hello2(person)
    end
  end
end
