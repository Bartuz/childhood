class AddColumnChildrenHealthNotes < ActiveRecord::Migration
  def change
  	add_column :children, :health_notes, :string, :null=>true
  end
end
