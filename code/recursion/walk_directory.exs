defmodule Directory do
  def walk(dir \\ ".") do
    Enum.each(File.ls!(dir), fn file ->
      unless hidden_file?(file) do
        file_name = "#{dir}/#{file}"

        # just a file, print it
        if File.dir?(file_name) do
          file_name |> directory_report
          # recursively step into next directory
          file_name |> walk
        else
          IO.puts(file_name)
        end
      end
    end)
  end

  defp directory_report(dir) do
    IO.puts("\n" <> dir <> " [DIR]")
    IO.puts(String.duplicate("-", String.length(dir) + 6))
  end

  defp hidden_file?(file) do
    String.starts_with?(file, ".")
  end
end

# Directory.walk "/Users/karmenblake/Projects/elixir-stuff/functional-programming"
Directory.walk()
