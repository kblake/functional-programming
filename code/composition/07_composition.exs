# Composition
# piping
# "Transforming Data"

# filing = prepare_filing(sales_tax(Orders.for_customers(DB.find_customers), 2016))
# inject_blank_urls(markdownify(task.formatted_task_text)).html_safe

greeting        = "hello world"
upcase_greeting = String.upcase(greeting)
loud_greeting   = upcase_greeting <> "!"
IO.puts loud_greeting

# compose functions
upcase_greeting = fn greeting -> String.upcase(greeting) end
loud_greeting   = fn greeting -> greeting <> "!" end
shout_greeting  = loud_greeting.(upcase_greeting.("hello world"))
IO.puts shout_greeting


# Unix
# f | g

# Haskell
# foo = f . g

# F#, Elixir, Elm
# foo = f |> g

shout_greeting = "hello world" |> upcase_greeting.() |> loud_greeting.()
# shout_greeting = "hello world"
#                   |> upcase_greeting.()
#                   |> loud_greeting.()
IO.puts shout_greeting

names = ["jane","jack","john"]
hip_names = names |> Enum.map(&String.capitalize/1) |> Enum.map &(&1 <> ".ly")

# long-hand
# hip_names2 = names
#              |> Enum.map(fn name -> String.capitalize(name) end)
#              |> Enum.map(fn name -> name <> ".ly" end)


# In summary, you can things that look like this:
# filing = prepare_filing(sales_tax(Orders.for_customers(DB.find_customers), 2016))

# To this:
# filing = DB.find_customers
#           |> Orders.for_customers
#           |> sales_tax(2016)
#           |> prepare_filing


# From this:
# inject_blank_urls(markdownify(task.formatted_task_text)).html_safe

# To this:
# task
# |> formatted_task_text
# |> markdownify
# |> inject_blank_urls
# |> html_safe
