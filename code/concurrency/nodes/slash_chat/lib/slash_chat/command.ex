defmodule SlashChat.Command do
  defp pm sender, message do
    [recipient | message_tail] = String.split(message, " ")
    SlashChat.Server.send_message(String.to_atom(recipient), Enum.join(message_tail, " "), sender)
  end

  defp strip_command message do
    message
    |> String.split(" ")
    |> List.delete_at(0)
    |> Enum.join(" ")
  end

  defp get_command message do
    message
    |> String.split(" ")
    |> List.first
  end

  def process sender, message do
    case get_command(message) do
      "/all" -> SlashChat.Server.broadcast(sender, strip_command(message))
      "/pm" -> pm(sender, strip_command(message))
      "/exit" -> SlashChat.Server.release(sender)
      _ -> SlashChat.Server.send_message(sender, "Invalid command", SlashChat.Server.server_name)
    end
  end
end
