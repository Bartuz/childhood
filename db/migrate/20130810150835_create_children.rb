class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.references :parent, index: true, :null=>false

      t.timestamps
    end
  end
end
