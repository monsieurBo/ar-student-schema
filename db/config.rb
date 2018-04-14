require 'active_record'
require_relative '../app/models/student.rb'
require_relative '../app/models/teacher.rb'
require_relative '../app/models/subject.rb'
require_relative '../db/interface.rb'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")


puts <<~STR
==============================
==== WELCOME TO HIGH HIGH ====
==============================
STR

if login
	main_menu
else
	puts "Email not found"
end