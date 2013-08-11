class Event < ActiveRecord::Base
	belongs_to :child
	belongs_to :classroom
	belongs_to :category
end
