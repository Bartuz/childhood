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

def create_child(first, last, parent, birthdate, educational_setting, profile_pic_url, health_notes, address )
	Child.create(
		:first_name=>first, 
		:last_name=>last,
		:parent=>parent,
		:birthdate=>birthdate,
		:educational_setting=> educational_setting,
    	:picture_url=>profile_pic_url,
    	:health_notes=>health_notes,
    	:address => address
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

def create_event(indicator, observations, interpretation, occurred_on, picture_url, classroom, child, category)
	event = Event.create(
		:indicator=>indicator, 
		:observations=>observations, 
		:interpretation=>interpretation,
		:occurred_on=>occurred_on, 
		:classroom=>classroom, 
		:child=>child,
		:picture_url => picture_url,
		:category=>category
	)
	event
end


p_max = create_parent("Maxime", "Rousseaux-Bridle", "max@12gsolutions.com")
p_alison = create_parent("Alison", "Livey Gibbins", "canada_fish@hotmail.com")

e_chris = create_educator("Chris", "Buccella", "chrisbuccella@gmail.com")
e_mtomas = create_educator("Ms. J", "Tomas", "ms.jtomas@gmail.com")
e_erin = create_educator("Erin", "Williams", "to.erin.williams@gmail.com")

c_isla = create_child("Isla", "Rousseaux-Bridle", p_max, Date.new(2009, 6, 9), "School", "isla.jpg", "", "612 Alexander Rd., Toronto, Ontario, M5G 15C")
c_orion = create_child("Orion", "Rousseaux-Bridle", p_max, Date.new(2011, 3, 29), "Child care", "02.jpg", "", "612 Alexander Rd., Toronto, Ontario, M5G 15C")

chris_class = create_classroom("Chris' Classroom", "", [e_chris], [ c_isla, c_orion ])

cat_mathematics = create_category("Mathematics", "Study of numbers")
cat_language = create_category("Language", "Study of speaking")

create_event(
	"Recognized some quantities without having to count", 
	"Isla sat at the table in the kitchen centre. Another child asked, 'Can I have an apple?' Sam looked at the apples on his plate and said, 'Sure, I have 6 anyways'", 
	"Isla fulfilled this expectation to count objects without pointing at them one by one",
	Date.new(2012, 01, 16), "blocks.jpg", chris_class, c_isla, 
	cat_mathematics
)
create_event(
	"Listen and respond to others for a variety of purposes", 
	nil, 
	nil,
	Date.new(2012, 01, 21), nil, chris_class, c_isla, 
	cat_language
)
