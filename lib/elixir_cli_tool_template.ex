defmodule ElixirCliToolTemplate do
  def main(args) do
    {parsed, _argv, errors} = OptionParser.parse(args, strict: [example: :string])

    if parsed !== [] do
      [example: x] = parsed
      IO.puts("Hello #{x}")
    else
      IO.puts("Hello World")
    end

    if errors !== [] do
      for {key, value} <- errors do
        if value do
          IO.puts("Incorrect arg \"#{key}\" with value \"#{value}\"")
        else
          IO.puts("Incorrect arg \"#{key}\"")
        end
      end
    end
  end
end
