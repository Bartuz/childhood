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
#e_mtomas = create_educator("Ms. J", "Tomas", "ms.jtomas@gmail.com")
#e_erin = create_educator("Erin", "Williams", "to.erin.williams@gmail.com")

c_isla = create_child("Ava", "", p_max, Date.new(2009, 6, 9), "School", "isla.jpg", "", "612 Alexander Rd., Toronto, Ontario, M5G 15C")
c_orion = create_child("Galen", "Gibbins", p_max, Date.new(2011, 3, 29), "Child care", "02.jpg", "", "612 Alexander Rd., Toronto, Ontario, M5G 15C")

chris_class = create_classroom("Chris' Classroom", "", [e_chris], [ c_isla, c_orion ])

cat_mathematics = create_category("Mathematics", "Study of numbers")
create_category("Numeration", "", cat_mathematics)
create_category("Pattern", "", cat_mathematics)
create_category("Sorting", "", cat_mathematics)
create_category("Data management", "", cat_mathematics)
create_category("Measurement", "", cat_mathematics)
create_category("Geometry", "", cat_mathematics)
create_category("Process", "", cat_mathematics)
create_category("Problem solving", "", cat_mathematics)
create_category("Reasoning", "", cat_mathematics)
create_category("Reflecting", "", cat_mathematics)
create_category("Selecting tools", "", cat_mathematics)
create_category("Connecting", "", cat_mathematics)

cat_science = create_category("Science and Technology", "")
create_category("Awarenewss", "", cat_science)
create_category("Observing", "", cat_science)
create_category("Predicting", "", cat_science)
create_category("Communicating", "", cat_science)


cat_language = create_category("Language", "Study of speaking")

cat_cognition = create_category("Cognition", "...")
cat_cognition_sub1 = create_category("Temporal", "...", cat_cognition)
cat_emotional = create_category("Emotional", "...")
cat_emotional_sub1 = create_category("Expression of Feelings", "...", cat_emotional)
cat_physical = create_category("Physical", "...")
cat_physical_sub1 = create_category("Fine Motor", "...", cat_physical)

#c_isla events
create_event(
	"",
	"Ava sprayed water on the concrete. Ava said, 'I sprayed my name.'",
	nil,
	Date.new(2013, 8, 1), "blocks.jpg", chris_class, c_isla,
	cat_mathematics
)
create_event(
  "",
  "Ava set up cups, spoons and a third cup on the concrete. Set like a table, Ava said, 'welcome to my tea party.' Cognitive : representation",
	nil,
	Date.new(2013, 8, 3), nil, chris_class, c_isla,
	cat_language
)
create_event(
    "",
    "Ava and Bevin transferred water to a pile of dirt. Bevin said, 'here you can use this one' social: helping skills: offering materials",
    nil,
    Date.new(2013, 8, 5), "blocks.jpg", chris_class, c_isla,
    cat_mathematics
)
create_event(
    "",
    "Ava cut a tomato and placed pieces into four diff cups to serve equal portions. Cognitive sorting, counting,",
    nil,
    Date.new(2013, 8, 7), nil, chris_class, c_isla,
    cat_science
)
create_event(
    "Spatial awareness, sharing and playing with others.",
    "Very vocal and intuitive. Remembers names, details and places with great detail. Elise loves to share details and has a vivid imagination.",
    nil,
    Date.new(2013, 8, 7), "groupplay.jpg", chris_class, c_isla,
    cat_emotional
)
create_event(
    "Sharing with other children. Making and keeping friends. Picking vegetables using motor skills.",
    "Very verbal and descriptive with language. Talked about how he came to school today, Hudson loves to talk and shares very well.",
    nil,
    Date.new(2013, 8, 9), nil, chris_class, c_isla,
    cat_emotional
)
create_event(
    "Playing and sharing with others.",
    "Student likes to be self directed and play on their own. Likes to discover and try a variety of activities.",
    nil,
    Date.new(2013, 8, 11), "groupplay.jpg", chris_class, c_isla,
    cat_emotional
)
create_event(
    "Using fine and gross motor skills to plant seeds in a cup.",
    "Student was able to dig, sort and plant seeds. They enjoyed burying the seeds and watering them after.",
    "Gross motor skills are developing well. Snatched a cup from another student but was quick to return it.",
    Date.new(2013, 8, 11), "sandbucket.jpg", chris_class, c_isla,
    cat_physical
)
create_event(
    "Cognition - Problem Solving",
    "Ava recognized she needed water for the seeds she was planting. She walked over to the water play and used a scoop to bring water over to her pot.",
    "Ava understands that seeds need water to grow. She did not have water in the gardening centre so found another way to collect what she needed to help her plants grow.",
    Date.new(2013, 8, 10), nil, chris_class, c_isla,
    cat_cognition_sub1
)
create_event(
    "Conversing with adults",
    "Ava said: 'you can take two, put water in your tank and put your hand in to squish them.'",
    nil,
    Date.new(2013, 8, 10), nil, chris_class, c_isla,
    cat_language
)
create_event(
    "",
    "Ava helping skills, asks griffin to join in building a sand castle to cheer him up.",
    nil,
    Date.new(2013, 8, 9), nil, chris_class, c_isla,
    cat_physical_sub1
)
create_event(
    "",
    "Ava proud of her character and her abilities as a 5 yr old",
    nil,
    Date.new(2013, 8, 9), nil, chris_class, c_isla,
    cat_physical
)

#c_orion events
create_event(
    "Spatial exploration",
    "Galen scooped up the dirt in a cup and then poured it out onto the grass. He watched dirt fall and then reached down to pick up the dirt again.",
    nil,
    Date.new(2013, 8, 10), nil, chris_class, c_orion,
    cat_cognition_sub1
)
create_event(
    "Self regulation",
    "Do you want to build a sand castle now? Falls down. Ok, let's make a cake instead.",
    "Recovering",
    Date.new(2013, 8, 9), nil, chris_class, c_orion,
    cat_emotional
)
create_event(
    "Self regulation",
    "Atticus said, 'They're gonna have a wash in there.' Comm Lang Lit - forming sentences",
    nil,
    Date.new(2013, 8, 10), nil, chris_class, c_orion,
    cat_physical
)
create_event(
    "",
    "Elise cog attn regulation with scooping water",
    nil,
    Date.new(2013, 8, 8), nil, chris_class, c_orion,
    cat_physical
)
create_event(
    "",
    "Atticus looked at the gravel and walks back to his shoes put them on and then walked back onto the gravel. Cog prob solv",
    nil,
    Date.new(2013, 8, 8), "groupplay.jpg", chris_class, c_orion,
    cat_mathematics
)
create_event(
    "",
    "Ophelia hits an elephant against ECE shoulder. Elephant makes noise. Ophelia hits other hand on ECE's other shoulder. No sounds. Ophelia repeats. Cognition cause and effect.",
    nil,
    Date.new(2013, 8, 6), nil, chris_class, c_orion,
    cat_physical
)
create_event(
    "",
    "Mia transferred water from one bucket to another with a cup",
    nil,
    Date.new(2013, 8, 6), "groupplay.jpg", chris_class, c_orion,
    cat_physical
)
create_event(
    "",
    "Bevin said, 'there's two now. We'll use the small cup to water the small one and the big one for the big one'",
    nil,
    Date.new(2013, 8, 4), nil, chris_class, c_orion,
    cat_physical
)
