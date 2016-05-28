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

  def pid_for registered_name do
    :global.whereis_name(registered_name)
  end

  def message_dispenser do
    receive do
      {:all, sender, message} ->
        Enum.each recipients_for(sender), fn node ->
          send pid_for(node), {sender, message}
        end
        message_dispenser
    end
  end
end
