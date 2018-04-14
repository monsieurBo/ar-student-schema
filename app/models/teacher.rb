class Teacher < ActiveRecord::Base
	has_many :subjects
	has_many :students, through: :subjects

	validates :email, 
	   		:presence => true, 
	  		:uniqueness => true,
	  		:format => {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,}+\z/, message: 'is not a valid email address'}

end