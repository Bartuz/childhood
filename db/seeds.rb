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

def create_child(first, last, parent, birthdate, url )
	Child.create(
		:first_name=>first, 
		:last_name=>last,
		:parent=>parent,
		:birthdate=>birthdate,
    :picutre_url=>url
	)
end

def create_classroom(name, description, educator, children)
	classroom = Classroom.create(:name=>name, :description=>description)
	classroom.educators << educator
	classroom.children << children 
	classroom
end

def create_category(name, description, parent=nil)
	if(parent)
		Category.create(:name=>name, :description=>description, :parent_category=>parent)
	else
		Category.create(:name=>name, :description=>description)
	end
end

def create_event(title, notes, occurred_on, classroom, child, categories)
	event = Event.create(:title=>title, :notes=>notes, :occurred_on=>occurred_on, :classroom=>classroom, :child=>child)
	event.categories = categories
	event
end


p_max = create_parent("Maxime", "Rousseaux-Bridle", "max@12gsolutions.com")
p_alison = create_parent("Alison", "Livey Gibbins", "canada_fish@hotmail.com")

e_chris = create_educator("Chris", "Buccella", "chrisbuccella@gmail.com")
e_mtomas = create_educator("Ms. J", "Tomas", "ms.jtomas@gmail.com")
e_erin = create_educator("Erin", "Williams", "to.erin.williams@gmail.com")

c_isla = create_child("Isla", "Rousseaux-Bridle", p_max, Date.new(2009, 6, 9), "01.jpg")
c_orion = create_child("Orion", "Rousseaux-Bridle", p_max, Date.new(2011, 3, 29), "02.jpg")

chris_class = create_classroom("Chris' Classroom", "", [e_chris], [ c_isla, c_orion ])

cat_numeracy = create_category("Numeracy", "Study of numbers")
cat_numeration = create_category("Numeration", "", cat_numeracy)
cat_pattern = create_category("Patterns", "", cat_numeracy)
cat_sorting = create_category("sorting", cat_numeracy)
cat_data_management = create_category("data management", cat_numeracy)
cat_measurement = create_category("measurment", cat_numeracy)

create_event("Numerations", "A description", Date.new(2012, 01, 16), chris_class, c_isla, 
	[cat_numeration, cat_pattern]
)
create_event("Sorting Stuff", "A description", Date.new(2012, 01, 21), chris_class, c_isla, 
	[cat_sorting]
)
create_event("Data Play", "A description", Date.new(2012, 01, 24), chris_class, c_isla, 
	[cat_data_management]
)
