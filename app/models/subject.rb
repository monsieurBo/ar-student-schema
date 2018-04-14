class Subject < ActiveRecord::Base
	belongs_to :student
	belongs_to :teacher
	
	def create_class
		p Student.all
	end


end
