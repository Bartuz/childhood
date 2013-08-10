# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_user(first, last, email)
  User.create(:first_name=>first, :last_name=>last, :email=>email, :password=>"password")
end

def create_parent(first, last, email)
	Parent.create( :user=>create_user(first, last, email) )
end

def create_educator(first, last, email)
  Educator.create( :user=>create_user(first, last, email) )
end

def create_child_attributes(first, last, parent, birthdate )
	{
		:first_name=>first, 
		:last_name=>last,
		:parent=>parent,
		:birthdate=>birthdate
	}
end

def create_classroom(name, description, children)
	classroom = Classroom.create(:name=>name, :description=>description)
	children.each do |child|
		classroom.children.create(child)
	end
end

p_max = create_parent("Maxime", "Rousseaux-Bridle", "max@12gsolutions.com")
p_alison = create_parent("Alison", "Livey Gibbins", "canada_fish@hotmail.com")

e_chris = create_educator("Chris", "Buccella", "chrisbuccella@gmail.com")
e_mtomas = create_educator("Ms. J", "Tomas", "ms.jtomas@gmail.com")
e_erin = create_educator("Erin", "Williams", "to.erin.williams@gmail.com")

c_isla = create_child_attributes("Isla", "Rousseaux-Bridle", p_max, Date.new(2009, 6, 9))
c_orion = create_child_attributes("Orion", "Rousseaux-Bridle", p_max, Date.new(2011, 3, 29))

chris_class = create_classroom("Chris' Classroom", "", [ c_isla, c_orion ]
