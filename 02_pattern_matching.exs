# A little about pattern matching
# Not an assignment but an assertion
# = is a match operator

# pattern matching statements
a = 1
1 = a

# a only matches with 1
# does not match
2 = a


list = [1,2,3]
[a,b,c] = list
IO.puts a
IO.puts b
IO.puts c

# not assigning
# does not match
#[1,4,3] = list

^list = [1,4,3]

# these do not match
# [1,2,3] = [1,4,3]



# ignore values
# matching
# underscores are ignore
# "foo" matches "foo"
[_, _, "foo"] = [1, 2, "foo"]
# not a match
[2,1,"foo"] = [1,2,"foo"]

[_, _, "foo"] = [100, 3939, "foo"]

# [1, _, "foo"] = [_, 3939, "foo"]


# pattern matching tuples
{:ok, value} = {:ok, 1000}
IO.puts value

{:error, message} = {:error, "Could not perform task!"}
IO.puts message

# does not match
{:foo, value} = {:bar, "nope"}
IO.puts value
