class Parent < ActiveRecord::Base
	has_one :user
	has_many :children
end
