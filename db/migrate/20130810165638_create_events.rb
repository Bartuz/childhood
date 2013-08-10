class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :null=>false
      t.string :notes
      t.date :occurred_on, :null=>false
      t.references :classroom, index: true
      t.references :child, index: true

      t.timestamps
    end
  end
end
