@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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
    @students << {name: name, cohort: cohort.to_sym}
    # output the number of students
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name = gets.chomp.capitalize
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_students_list
  @students.each.with_index(1) do |student,index|
  puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students == []
    puts "There are not students yet"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def print_specific_letter
  puts "-------------"
  puts "Students beginning with the letter 'M':"
  @students.each do |student| puts "#{student[:name]}" if student[:name][0] == "M"
  end
end

def print_less_than_12_characters
  puts "-------------"
  puts "Students with less than 12 characters:"
  @students.each do |student| puts "#{student[:name]}" if student[:name].length < 12
  end
end

def print_loop
  puts "-------------"
  puts "Print students using looping:"
  count = 0
  while count < @students.length do
    puts "#{students[count][:name]}"
    count += 1
  end
end

def print_groups
# students will look something like this:
# [{:name=>"Dave", :cohort=>:May}, {:name=>"Frank", :cohort=>:March}, {:name=>"Mark", :cohort=>:May}]
# goal to be able to display the people in each cohort group is to get to this:
# {:May => ["Dave", "Mark"], :March => ["Frank"]}
  puts "-------------"
  people_by_group = {}

  @students.each do |person|
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

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

# nothing happens until we call the methods
#input_students
#print_header
#print_students
#print_footer
#print_groups
#print_specific_letter
#print_less_than_12_characters
#print_loop
interactive_menu