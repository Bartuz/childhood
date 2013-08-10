class Event < ActiveRecord::Base
	belongs_to :child
	belongs_to :classroom
	has_many :categories

end
