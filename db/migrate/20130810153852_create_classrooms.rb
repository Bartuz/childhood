class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
    	t.string :name, :null=>false
      t.string :description
      t.references :educator, index: true

      t.timestamps
    end
  end
end
