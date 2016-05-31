defmodule SlashChat.Server do
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

  def send_message recipient, message, sender do
    send pid_for(recipient), {format_sender(sender), message}
  end

  def release sender do
    broadcast(sender, "Has left the network.")
    # This unregister isn't working as I want it to yet.
    # I would like any more broadcasts to avoid notifying the
    # sender that is exiting.
    #:global.unregister_name(sender)
  end

  def broadcast sender, message do
    Enum.each recipients_for(sender), fn node ->
      send pid_for(node), {format_sender(sender), message}
    end
  end

  def message_dispenser do
    receive do
      {:all, sender, message} ->
          if String.starts_with?(message, "/") do
            SlashChat.Command.process(sender, message)
          else
            broadcast(sender, message)
          end
        message_dispenser
    end
  end
end
