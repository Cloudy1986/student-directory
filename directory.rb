# Let's put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddie Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# And then print them
puts "The students of Villians Academy"
puts "-------------"
students.each do |student|
  puts student
end

# finally, we print the total
puts "Overall, we have #{students.count} great students"