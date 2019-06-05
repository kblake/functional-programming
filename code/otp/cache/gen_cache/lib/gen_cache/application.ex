defmodule GenCache.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {GenCache, []}
    ]

    opts = [strategy: :one_for_one, name: GenCache.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
