def login
	puts "Please enter your email"
	print ">> "
	email = gets.chomp
	user = Teacher.find_by_email(email)
	if user
		puts "Welcome, #{user.first_name} #{user.last_name}"
		return true
	end
end

def list_student_details
	puts <<~STR
	\n====== LIST STUDENTS =====
  ======== OPTIONS =========

  1. Order by ID
  2. Order by Students Name
  3. Order by Date of Creation
	STR
	print ">> "
	option = gets.chomp
	case option
	when "1"
		puts "Order by ID"
		students = Student.all
		students.each_with_index do |student, index|
			puts "#{index}. id: #{student.id} | First Name: #{student.first_name} | Last Name: #{student.last_name} | Gender: #{student.gender} | Birthday: #{student.birthday} | Email: #{student.email} | Phone: #{student.phone}"
		end
	when "2"
		puts "Order by Name"
		students = Student.order("first_name")
		students.each_with_index do |student, index|
			puts "#{index}. id: #{student.id} | First Name: #{student.first_name} | Last Name: #{student.last_name} | Gender: #{student.gender} | Birthday: #{student.birthday} | Email: #{student.email} | Phone: #{student.phone}"
		end
	when "3"
		puts "Order by Date of Creation"
		students = Student.order("created_at DESC")
		students.each_with_index do |student, index|
			puts "#{index}. id: #{student.id} | First Name: #{student.first_name} | Last Name: #{student.last_name} | Gender: #{student.gender} | Birthday: #{student.birthday} | Email: #{student.email} | Phone: #{student.phone}"
		end
	end
end

def save_check
	if applicant.save
		puts "Student saved!"
		save = true
	else
		puts "There was an error in your input. Please check and try again."
		puts applicant.errors.messages
	end
end

def create_enrolment
	save = false
	while !save
		para = {}

		puts "==== CREATE STUDENT ===="
		puts "========================"
		puts "Student's first name"
		print ">> "
		para[:first_name] = gets.chomp
		puts "Student's last name"
		print ">> "
		para[:last_name] = gets.chomp
		puts "Student's gender"
		print ">> "
		para[:gender] = gets.chomp
		puts "Student's birthday"
		print ">> "
		para[:birthday] = gets.chomp
		puts "Student's email"
		print ">> "
		para[:email] = gets.chomp
		puts "Student's phone"
		print ">> "
		para[:phone] = gets.chomp
			applicant = Student.new(para)

		if applicant.save
			puts "Student saved!"
			save = true
		else
			puts "There was an error in your input. Please check and try again."
			puts applicant.errors.messages
		end
	end
end

def update_student_details
  change = {}

	loop do
		puts <<~STR
			===== UPDATE DETAILS ====
      ======== OPTIONS ========
      1. First Name
      2. Last Name
      3. Gender
      4. Birthday
      5. Email
      6. Phone
      7. Save and EXIT
 	 STR

		puts "Option:"
    print ">> "
    input = gets.chomp
    case input
    when "1"
      puts "===== UPDATE ====="
      puts "=== FIRST NAME ==="
    	print ">> "
    	change[:first_name] = gets.chomp
    when "2"
      puts "===== UPDATE ====="
      puts "=== LAST NAME ==="
    	print ">> "
    	change[:last_name] = gets.chomp
    when "3"
      puts "===== UPDATE ====="
      puts "===== GENDER ====="
    	print ">> "
    	change[:gender] = gets.chomp
    when "4"
      puts "===== UPDATE ====="
      puts "==== BIRTHDAY ===="
    	print ">> "
    	change[:birthday] = gets.chomp
    when "5"
      puts "===== UPDATE ====="
      puts "===== EMAIL ======"
    	print ">> "
    	change[:email] = gets.chomp
    when "6"
      puts "===== UPDATE ====="
      puts "===== PHONE ======"
    	print ">> "
    	change[:phone] = gets.chomp
    when "7"
      puts "===== SAVE & ====="
      puts "====== EXIT ======"
      puts "You've changed: "
      change.each do |k,v|
      	print "| #{k}: #{v} |"
      end
      puts "\nProceed to save? (y/n)"
    	print ">> "
    	proceed = gets.chomp
    	case proceed
    	when "y"
    		self.update(change)
    		save_check
    	when "n"
    		puts "You chose not to save. What would you like to do?"
    		puts "1. Edit change"
    		puts "2. EXIT"
    		print ">> "
    		no = gets.chomp
    		case no
    		when "1"
    		when "2"
    			puts "EXIT without saving."
    			break
    		end
    	end
    else
      puts "Invalid option!"
    end
  end
end

def main_menu
	loop do
		puts <<~STR
			========== MENU ==========

			Total number of students: #{Student.count}
			1. List all students
			2. Create new student
			3. Find and edit a student
			4. EXIT

		STR
		print ">> "
		option = gets.chomp
		case option
		when "1"
			system "clear" or system "cls"
			list_student_details
		when "2"
			system "clear" or system "cls"
			create_enrolment
		when "3"
			system "clear" or system "cls"
			locate_student
		when "4"
			system "clear" or system "cls"
			puts "Bye Bye. See you again."
			break
		end
		
	end
end

def locate_student
	puts <<~STR
	\n====== FIND STUDENT =====
  ======== OPTIONS ========

  1. Search with ID
  2. Search with Gender
  3. Search with Age
  4. Search with Name Initials
	STR
	print ">> "
	option = gets.chomp
	loop do
		student = nil
		case option
		when "1"
			puts "Please enter the student id"
			search = gets.chomp
			student = Student.find_by(id: search)
		when "2"
			puts "Please enter the student gender"
			search = gets.chomp
			student = Student.find_by(gender: search)
		when "3"
			puts "Please enter the student age"
			# puts "We don't discriminate by age"
			search = gets.chomp
			container = []
			student = Student.all
			student.each do |birthday|
				if search == birthday.age
					container << birthday
				end
			end
			if container.length > 0
				container.each_with_index do |x, index|
					puts "#{index}. " + x
				end
				puts "Please select "
			end

		when "4"
			# puts "Please enter the name initials"
			puts "We don't discriminate by age"
			# search = gets.chomp
			# search = "birthday: #{search}"
		else
			puts "Invalid input"
		end

		p student
		if student && container = nil
			puts "id: #{student.id} | First Name: #{student.first_name} | Last Name: #{student.last_name} | Gender: #{student.gender} | Birthday: #{student.birthday} | Email: #{student.email} | Phone: #{student.phone}"
			puts <<~STR
			==========================
			What would you like to do?
			1. Update student's detail
			2. Delete the student

			- "Enter" to return to menu -
			STR
			print ">> "
			option = gets.chomp
			case option
			when "1"
				update_student_details
			when "2"
				student.delete
			when ""
				break
			end
		else
			puts "Not found."
			break
		end
	end

	
end 