class Educator < ActiveRecord::Base
	has_one :user
	has_many :classrooms
end
