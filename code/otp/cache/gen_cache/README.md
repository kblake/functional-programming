# GenCache

**Simple Cache using a GenServer to maintain state**

## Usage

```elixir
iex -S mix

> GenCache.contents()
%{}

> GenCache.add("id1", "foo")
> GenCache.add("id1", "bar")

> GenCache.contents()
%{"id1" => "foo", "id2" => "bar"}

> GenCache.remove("id1")
> GenCache.contents()
%{"id2" => "bar"}
```