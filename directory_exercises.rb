def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # get more info about students
    puts "Enter hobbies"
    hobby = gets.chomp
    puts "Enter country of birth"
    country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(students)
  students.each.with_index(1) do |student,index|
    puts "#{index}. #{student[:name]} (cohort: #{student[:cohort]}, hobby: #{student[:hobby]}, country: #{student[:country]})"
  end
end

def print_specific_letter(students)
  puts "-------------"
  puts "Students beginning with the letter 'M':"
  students.each do |student| puts "#{student[:name]}" if student[:name][0] == "M" || student[:name][0] == "m"
  end
end

def print_less_than_12_characters(students)
  puts "-------------"
  puts "Students with less than 12 characters:"
  students.each do |student| puts "#{student[:name]}" if student[:name].length < 12
  end
end

def print_loop(students)
  puts "-------------"
  puts "Print students using looping:"
  count = 0
  while count < students.length do
    puts "#{students[count][:name]}"
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_specific_letter(students)
print_less_than_12_characters(students)
print_loop(students)