
input = gets(chomp: true)

if 400 <= input.to_i && input.to_i <= 599
  puts "Yes"
else
  puts "No"
end