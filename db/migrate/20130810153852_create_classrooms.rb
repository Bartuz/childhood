class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :educator, index: true

      t.timestamps
    end
  end
end
