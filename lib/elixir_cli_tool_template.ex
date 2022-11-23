defmodule ElixirCliToolTemplate do
  def main(args) do
    {parsed, _argv, errors} =
      OptionParser.parse(args, strict: [greet: :string, a_number: :integer])

    if parsed !== [] do
      for command <- parsed do
        res =
          case command do
            {:greet, v} -> "Hello #{v}"
            {:a_number, v} -> "This is a number: #{v}"
          end

        IO.puts(res)
      end
    else
      IO.puts("Hello World")
    end

    if errors !== [] do
      for {key, value} <- errors do
        if value do
          IO.puts("Incorrectly used known arg \"#{key}\" with value \"#{value}\"")
        else
          IO.puts("Incorrect arg \"#{key}\"")
        end
      end
    end
  end
end
