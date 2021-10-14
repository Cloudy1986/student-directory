@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    successful_action
  when "2"
    show_students
    successful_action
  when "3"
    choose_file
    save_students
    successful_action
  when "4"
    choose_file
    load_students
    successful_action
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  # Months array for the cohorts
  months = ["january","february","march","april","may","june","july","august","september","october","november","december"]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  cohort = ""
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for cohort while user inputs correct input
    while !months.include? cohort
      puts "Enter cohort: "
      cohort = STDIN.gets.downcase.chomp
    end
    # convert a string into symbol
    cohort = cohort.to_sym
    # add the student hash to the array
    add_student(name, cohort)
    # Use singular form when appropriate and plural form otherwise
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def successful_action
  puts "             "
  puts "-------------"
  puts "Action was successfully completed"
  puts "-------------"
  puts "             "
end

def choose_file
  puts "Enter the filename you want to use"
  @user_filename = gets.chomp.downcase
end

def save_students
  # open the file for writing
  File.open(@user_filename, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
    end
  end
end

def load_students
  File.open(@user_filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
    end
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # if a filename is not provided
    @user_filename = "students.csv"
    load_students
  elsif File.exists?(filename) # if a filename is provided and it exists real_file.csv
    @user_filename = filename
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  else # if a filename is provided but it doesn't exist e.g made_up_file.csv
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu