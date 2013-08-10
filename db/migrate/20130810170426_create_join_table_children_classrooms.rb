class CreateJoinTableChildrenClassrooms < ActiveRecord::Migration
  def change
   create_table :children_classrooms, id: false do |t|
      t.belongs_to :child
      t.belongs_to :classroom
    end

  end
end
