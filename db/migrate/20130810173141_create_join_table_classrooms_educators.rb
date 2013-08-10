class CreateJoinTableClassroomsEducators < ActiveRecord::Migration
  def change
    create_join_table :classrooms, :educators do |t|
      t.index [:classroom_id, :educator_id]
      t.index [:educator_id, :classroom_id]
    end
  end
end
