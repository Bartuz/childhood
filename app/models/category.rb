class Category < ActiveRecord::Base
  	belongs_to :parent_category, class_name: "Category", foreign_key: "parent_category_id"
  	has_many :child_categories, class_name: "Category", foreign_key: "parent_category_id"

	has_many :event_categories
	has_many :events, through: :event_categories
end
