defmodule ElixirCliToolTemplate do
  def main(args) do
    {parsed, _argv, errors} = OptionParser.parse(args, strict: [example: :string])

    cond do
      parsed !== [] ->
        [example: x] = parsed
        IO.puts("Hello #{x}")
      errors !== [] ->
        for {key, value} <- errors do
          IO.puts("Incorrect arg \"#{key}\" with value \"#{value}\"")
        end
      true ->
        IO.puts("Hello World")
    end
  end
end
