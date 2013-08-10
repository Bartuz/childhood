class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :notes
      t.references :classroom, index: true
      t.references :child, index: true

      t.timestamps
    end
  end
end
