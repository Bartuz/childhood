class CreateJoinTableClassroomsTeachers < ActiveRecord::Migration
  def change
    create_join_table :classrooms, :teachers do |t|
      t.index [:classroom_id, :teacher_id]
      t.index [:teacher_id, :classroom_id]
    end
  end
end
