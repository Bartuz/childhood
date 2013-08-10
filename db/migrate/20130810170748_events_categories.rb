class EventsCategories < ActiveRecord::Migration
  def change
	create_table :events_categories, id: false do |t|
        t.belongs_to :event
		t.belongs_to :category
	end
  end
end