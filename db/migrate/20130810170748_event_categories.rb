class EventCategories < ActiveRecord::Migration
  def change
	create_table :events_categories, id: false do |t|
		t.references :event, index: true
		t.references :category, index: true
	end
  end
end
