class Classroom < ActiveRecord::Base
	has_many :educators
	has_and_belongs_to_many :children

end
