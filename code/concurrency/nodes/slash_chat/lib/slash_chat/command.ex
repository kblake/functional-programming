defmodule SlashChat.Command do
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

  defp invalid_command sender do
    SlashChat.Server.send_message(sender, "Invalid command", SlashChat.Server.server_name)
  end

  defp join_network sender do
    IO.puts Atom.to_string(sender) <> " has joined."
    SlashChat.Server.broadcast(sender, "has joined the network.")
  end

  defp leave_network sender do
    IO.puts Atom.to_string(sender) <> " has left."
    SlashChat.Server.broadcast(sender, "left the network.")
    SlashChat.Server.release(sender)
  end

  defp notify_all sender, message do
    SlashChat.Server.broadcast(sender, message)
  end

  defp private_message sender, message do
    [recipient | message_tail] = String.split(message, " ")
    SlashChat.Server.send_message(String.to_atom(recipient), Enum.join(message_tail, " "), sender)
  end

  def process sender, message do
    case get_command(message) do
      "/all" -> notify_all(sender, strip_command(message))
      "/exit" -> leave_network(sender)
      "/join" -> join_network(sender)
      "/pm" -> private_message(sender, strip_command(message))
      _ -> invalid_command(sender)
    end
  end
end
