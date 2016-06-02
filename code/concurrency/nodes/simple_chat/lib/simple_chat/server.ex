defmodule SimpleChat.Server do
  @server_name :chat_server

  def start do
    pid = spawn(__MODULE__, :message_dispenser, [])
    :global.register_name(server_name, pid)
  end

  def server_name do
    @server_name
  end

  def recipients_for sender do
    recips = List.delete :global.registered_names, server_name
    List.delete recips, sender
  end

  defp pid_for registered_name do
    :global.whereis_name(registered_name)
  end

  defp format_sender sender do
    sender
    |> Atom.to_string
    |> String.split("@")
    |> List.first
  end

  def message_dispenser do
    receive do
      {:all, sender, message} ->
        Enum.each recipients_for(sender), fn friend ->
          send_message(friend, sender, message)
        end
        message_dispenser
      {:private_message, sender, friend, message} ->
        send_message(friend, sender, message)
        message_dispenser
    end
  end

  defp send_message(friend, sender, message) do
    send pid_for(friend), {format_sender(sender), message}
  end
end
