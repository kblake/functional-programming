defmodule Server do
  use GenServer

  @server_name :chat_server

  def start_link do
    {:ok, pid} = GenServer.start_link(__MODULE__, [], name: server_name())
    :global.register_name(server_name(), pid)

    {:ok, pid}
  end

  def broadcast(sender, message) do
    GenServer.cast(server_name(), {:all, sender, message})
  end

  def direct_message(sender, friend, message) do
    GenServer.cast(server_name(), {:direct_message, sender, friend, message})
  end

  # GenServer calls ###################################
  def handle_cast({:all, sender, message}, _state) do
    Enum.each recipients_for(sender), fn friend ->
      send_message(friend, sender, message)
    end

    {:noreply, nil}
  end

  def handle_cast({:direct_message, sender, friend, message}, _state) do
    send_message(friend, sender, message <> " (DM)")

    {:noreply, nil}
  end

  # Private functions #################################
  defp server_name do
    @server_name
  end

  defp recipients_for sender do
    recips = List.delete :global.registered_names, server_name()
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

  defp send_message(friend, sender, message) do
    send pid_for(friend), {format_sender(sender), message}
  end
end
