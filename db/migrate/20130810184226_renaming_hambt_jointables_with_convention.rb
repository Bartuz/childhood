class RenamingHambtJointablesWithConvention < ActiveRecord::Migration
  def change
  	rename_table :event_categories, :events_categories
  	rename_table :children_classrooms, :children_categories
  end
end
