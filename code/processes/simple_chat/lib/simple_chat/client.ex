defmodule SimpleChat.Client do
  def start server: server_id do
    pid = spawn(__MODULE__, :message_listener, [])
    Node.connect server_id
    :global.register_name(Node.self, pid)
  end

  def server do
    :global.whereis_name(SimpleChat.Server.server_name)
  end

  def send_message message do
    send server, {:all, Node.self, message}
    :ok
  end

  def message_listener do
    receive do
      {sender, message} ->
        IO.puts "#{sender}: #{message}"
        message_listener
    end
  end
end
