class Event < ActiveRecord::Base
	belongs_to :child
	belongs_to :classroom
	has_and_belongs_to_many :categories
end
