# SlashChat

**Builds on the SimpleChat app to add commands to demonstrate pocesses in Elixir (Erlang)**

## Usage

  1. Server

        iex --sname server -S mix
        iex(server@yourcomputername)1> SlashChat.Server.start

  2. Client(s) - each client functioning in different terminal sessions

        iex --sname client1 -S mix
        clien1> SlashChat.Client.join_server :"server@yourcomputername"
        
        iex --sname client2 -S mix
        client2> SlashChat.Client.join_server :"server@yourcomputername"
        
        iex --sname client3 -S mix
        client3> SlashChat.Client.join_server :"server@yourcomputername"
        
  3. Client(s) - can send a private message to another client
        client1> SlashChat.Client.send_message "/pm client2@yourcomputername sup sup"
        client2> client1: sup sup
        client3> no message

  4. Client(s) - can get feedback about an invalid command
        client1> SlashChat.Client.send_message "/dance"

  5. Client(s) - can exit the network
        client1> SlashChat.Client.send_message "/exit"

