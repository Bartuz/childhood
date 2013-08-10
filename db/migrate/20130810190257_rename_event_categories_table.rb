class RenameEventCategoriesTable < ActiveRecord::Migration
  def change
  	rename_table :events_categories, :categories_events
  end
end
