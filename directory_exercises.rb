def input_students
  # ask for the names of students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # set up an empty array
  students = []
  # set up an array of valid months
  months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
  # set up variable for cohort
  cohort = ""
  # get name from user
  name = gets.chomp.capitalize
  # loop while name is not empty
  while !name.empty? do
    # while months doesn't include cohort, ask for the cohort and get the valid month
    while !months.include? cohort
      puts "Enter the month of their cohort"
      cohort = gets.chomp.capitalize
    end
    # convert cohort to a symbol
    cohort = cohort.to_sym
    # add a hash containing name and cohort to the students array
    students << {name: name, cohort: cohort.to_sym}
    # output the number of students
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp.capitalize
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
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print_specific_letter(students)
  puts "-------------"
  puts "Students beginning with the letter 'M':"
  students.each do |student| puts "#{student[:name]}" if student[:name][0] == "M"
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

def print_groups(students)
# students will look something like this:
# [{:name=>"Dave", :cohort=>:May}, {:name=>"Frank", :cohort=>:March}, {:name=>"Mark", :cohort=>:May}]
# goal to be able to display the people in each cohort group is to get to this:
# {:May => ["Dave", "Mark"], :March => ["Frank"]}
  puts "-------------"
  people_by_group = {}

  students.each do |person|
    group = person[:cohort]

    if people_by_group[group] == nil
    people_by_group[group] = []
    end

    people_by_group[group].push(person[:name])
  end
  
  puts "Which cohort would you like to print?"
  user_input = gets.chomp.capitalize.to_sym
  if people_by_group.has_key?(user_input)
    puts "The people in #{user_input.to_s}'s cohort are:"
    puts people_by_group[user_input]
  else
    puts "There isn't a cohort for the month you've chosen"
  end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_groups(students)
#print_specific_letter(students)
#print_less_than_12_characters(students)
#print_loop(students)