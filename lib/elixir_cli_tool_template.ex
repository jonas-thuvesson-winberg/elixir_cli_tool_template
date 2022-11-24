defmodule ElixirCliToolTemplate do
  @spec main([binary] | []) :: 0 | 1

  def main([]) do
    {:ok, ["Hello World!"]} |> print
  end

  def main(args) do
    {parsed, _argv, errors} =
      OptionParser.parse(args,
        strict: [greet: :string, a_number: :integer],
        aliases: [g: :greet, n: :a_number]
      )

    messages =
      for command <- parsed do
        case command do
          # handling v as a string, to not be parsed as a return value, in case of numbers
          {:greet, v} -> ["Hello ", "#{v}", "!"]
          {:a_number, v} -> ["This is a number: ", "#{v}", "."]
        end
      end

    if errors !== [] do
      errors =
        for {key, value} <- errors do
          if value do
            ["Incorrectly used known arg \"", key, "\" with value ", value, "."]
          else
            ["Incorrect arg \"", key, "\"."]
          end
        end

      {:error, errors} |> print
    else
      {:ok, messages} |> print
    end
  end

  @spec print({:ok | :error, iodata}) :: 0 | 1
  defp print({:ok, messages}) do
    for msg <- messages do
      IO.puts(msg)
    end

    0
  end

  defp print({:error, errors}) do
    for error <- errors do
      IO.puts(error)
    end

    1
  end
end
