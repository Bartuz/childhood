class CreateJoinTableChildrenEducators < ActiveRecord::Migration
  def change
    create_join_table :children, :educators do |t|
      t.index [:child_id, :educator_id]
      t.index [:educator_id, :child_id]
    end
  end
end
