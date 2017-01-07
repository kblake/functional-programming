defmodule Client do
  use GenServer

  @server_name :chat_server

  def client do
    __MODULE__
  end

  def start_link do
    GenServer.start_link(__MODULE__, [], name: client())
  end

  def join_server server_id, cookie \\ :"cookiemonster" do
    Node.set_cookie(Node.self, cookie)
    Node.connect server_id
    :global.register_name(Node.self, self())
  end

  def friends do
    recips = List.delete :global.registered_names, server_name()
    List.delete recips, Node.self
  end

  def broadcast(message) do
    GenServer.call(client(), {:all, Node.self, message})
  end

  def direct_message(sender, message) do
    GenServer.call(client(), {:direct_message, sender, message})
  end

  # GenServer calls ###################################
  def handle_call({:all, sender, message}, _from, _state) do
    Enum.each recipients_for(sender), fn _ ->
      IO.puts "#{format_sender(sender)}: #{message}"
    end

    {:reply, :ok, :ok}
  end

  def handle_call({:direct_message, sender, message}, _from, _state) do
    IO.puts "#{format_sender(sender)}: #{message}"

    {:reply, :ok, :ok}
  end

  # Private functions #################################
  defp server_name do
    @server_name
  end

  defp recipients_for sender do
    recips = List.delete :global.registered_names, server_name()
    List.delete recips, sender
  end

  defp format_sender sender do
    sender
    |> Atom.to_string
    |> String.split("@")
    |> List.first
  end
end
