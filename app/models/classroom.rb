class Classroom < ActiveRecord::Base
	has_many :educators
	has_many :children

end
