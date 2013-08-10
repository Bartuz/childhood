class Child < ActiveRecord::Base
	has_many :educators
	has_one :parent
end
