defmodule Cli.Main do
  alias Mix.Shell.IO, as: Shell
  alias Cli.Parse

  defp prompt do
    "Enter operator, and an optional operand: "
  end
  def start do
    get_input(0.0)
  end

  def get_input(acc) do
      prompt()
      |> Shell.prompt
      |> Parse.parse
      |> calculate(acc)
      |> get_input
  end

  def calculate({:quit}, acc) do
    Shell.info("Final result is #{acc}")
    exit(:shutdown)
  end

  def calculate({:error, error_message}, acc) do
    Shell.info(error_message)
    Shell.info("Result is still #{acc}")
    acc
  end

  def calculate({:ok, :plus, value}, acc) do
    result = acc + value
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :minus, value}, acc) do
    result = acc - value
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :multiply, value}, acc) do
    result = acc * value
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :divide, value}, acc) when value != 0.0 do
    result = acc / value
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :divide, value}, acc) when value == 0.0 do
    Shell.info("Haha very funny, lets not do that")
    Shell.info("Result is still #{acc}")
    acc
  end

  def calculate({:ok, :power, value}, acc) do
    result = acc ** value
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :square_root}, acc) when acc >= 0.0 do
    result = :math.sqrt(acc)
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :square_root}, acc) when acc < 0.0 do
    Shell.info("Stop living in an imaginary world")
    Shell.info("Result is still #{acc}")
    acc
  end

  def calculate({:ok, :invert_polarity}, acc) do
    result = acc * -1
    Shell.info("Result is #{result}")
    result
  end

  def calculate({:ok, :one_divided_by}, acc) do
    result = 1 / acc
    Shell.info("Result is #{result}")
    result
  end
end
