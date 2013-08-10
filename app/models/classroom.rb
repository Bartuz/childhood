class Classroom < ActiveRecord::Base
	has_and_belongs_to_many :children
	has_and_belongs_to_many :educators

end
