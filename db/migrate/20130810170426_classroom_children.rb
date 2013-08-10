class ClassroomChildren < ActiveRecord::Migration
  def change
   create_table :classroom_children, id: false do |t|
      t.references :child, index: true
      t.references :classroom, index: true
    end
  end
end
