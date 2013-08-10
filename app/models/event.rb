class Event < ActiveRecord::Base
	belongs_to :child
	belongs_to :classroom
	has_many :event_categories
	has_many :categories, through: :event_categories

end
