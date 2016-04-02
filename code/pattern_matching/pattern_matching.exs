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

# pin operator which keeps it from being reassigned
^list = [1,4,3]

# these do not match
# [1,2,3] = [1,4,3]


# ignore values
# matching
# underscores are ignored
# "foo" matches "foo"
[_, _, "foo"] = [1, 2, "foo"]
# not a match
[2,1,"foo"] = [1,2,"foo"]

[_, _, "foo"] = [100, 3939, "foo"]

# [1, _, "foo"] = [_, 3939, "foo"]
