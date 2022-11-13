defmodule Cli.Parse do

  def parse(input) when is_binary(input) do
    parse(String.split(input))
  end

  def parse([operator, value]) do
    try do
      parsed_value = String.to_float(value)
      case operator do
        "+" -> {:ok, :plus, parsed_value}
        "-" -> {:ok, :minus, parsed_value}
        "*" -> {:ok, :multiply, parsed_value}
        "/" -> {:ok, :divide, parsed_value}
        "^" -> {:ok, :power, parsed_value}
        _ -> {:error, "Invalid input"}
      end
    rescue
      ArgumentError -> {:error, "Invalid input"}
    end
  end

  def parse([operator]) do
    case operator do
      "#" -> {:ok, :square_root}
      "%" -> {:ok, :invert_polarity}
      "!" -> {:ok, :one_divided_by}
      "q" -> {:quit}
      _ -> {:error, "Invalid input"}
    end
  end

  def parse(_) do
    {:error, "Invalid input"}
  end
end
