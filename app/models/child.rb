class Child < ActiveRecord::Base
	belongs_to :parent
	has_and_belongs_to_many :classrooms
	has_many :events
end
