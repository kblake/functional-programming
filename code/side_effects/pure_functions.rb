name = { first: "jane", last: "doe" }

impure = -> name do
  # you can easily alter original
  name[:first] = "sally"
  name
end

new_name = impure.(name)

puts "Impure function - original is altered :("
puts name
puts new_name



name = { first: "jane", last: "doe" }

pure = -> name do
  name.merge({first: "sally"})
end

new_name = pure.(name)

puts
puts "Pure function - original value is not altered :)"
puts name
puts new_name
