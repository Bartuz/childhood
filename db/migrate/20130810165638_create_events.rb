class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :indicator, :null=>false
      t.string :observations
      t.string :interpretation
      t.string :picture_url, :null=>true
      t.date :occurred_on, :null=>false
      t.references :classroom, index: true
      t.references :child, index: true
      t.references :category, index: true, :null=>false

      t.timestamps
    end
  end
end
