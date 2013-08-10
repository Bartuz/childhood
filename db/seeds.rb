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

def create_child(first, last, parent, birthdate )
	Child.create(
		:first_name=>first, 
		:last_name=>last,
		:parent=>parent,
		:birthdate=>birthdate
	)
end

max = create_parent("Maxime", "Rousseaux-Bridle", "max@12gsolutions.com")
alison = create_parent("Alison", "Livey Gibbins", "canada_fish@hotmail.com")

chris = create_educator("Chris", "Buccella", "chrisbuccella@gmail.com")
mtomas = create_educator("Ms. J", "Tomas", "ms.jtomas@gmail.com")
erin = create_educator("Erin", "Williams", "to.erin.williams@gmail.com")

create_child("Isla", "Rousseaux-Bridle", max, Date.new(2009, 6, 9))