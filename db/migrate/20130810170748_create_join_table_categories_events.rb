class CreateJoinTableCategoriesEvents < ActiveRecord::Migration
  def change
	create_table :categories_events, id: false do |t|
        t.belongs_to :event
		t.belongs_to :category
	end
  end
end
