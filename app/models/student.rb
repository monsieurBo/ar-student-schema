require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
	include ActiveModel::Validations

	attr_accessor :email, :birthday, :phone

	validates :email, 
			   		:presence => true, 
			  		:uniqueness => { :case_sensitive => false },
			  		:format => {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,}+\z/, message: 'is not a valid email address'}


	validate :age_limit,
						:min_phone_numbers

	def name
		fname = "#{self.first_name} #{self.last_name}"
		return fname
	end

	def age
		if Date.today.month > self.birthday.month 
			age = Date.today.year - self.birthday.year
		elsif Date.today.month < self.birthday.month || (Date.today.month == self.birthday.month && Date.today.day < self.birthday.day)
			age = Date.today.year - self.birthday.year - 1
		end
		return age
	end

	private

	def age_limit
		if self.birthday.year >= Date.today.year - 5
			errors.add(:birthday, 'must be at least 5 years old.')
		end
	end

	def min_phone_numbers
		numbers = self.phone
		num = numbers.gsub(/[^\d]/, '')
		res = num.length
		if res < 10
			errors.add(:phone, 'must contain at least 10 numbers')
		end
	end

end

# p Student.all
# p student = Student.first
# p student.name
# p student.birthday.year
# p student.birthday.month
# p Time.now.month
# p student.age

# p student = Student.first
# p student.phone
# p student.min_phone_numbers