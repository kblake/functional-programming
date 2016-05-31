defmodule SlashChat.Command do
  defp pm sender, message do
    parts = String.split(message, " ")
    recipient = Enum.at(parts, 1)
    clean = Enum.join(List.delete_at(List.delete_at(parts,0),0), " ")
    SlashChat.Server.send_message(String.to_atom(recipient), clean, sender)
  end

  def process sender, message do
    split = String.split(message, " ")
    case split do
      ["/pm" | _] -> pm(sender, message)
      ["/exit" | _] -> SlashChat.Server.release(sender)
      _ -> SlashChat.Server.send_message(sender, "Invalid command", SlashChat.Server.server_name)
    end
  end
end
