class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name, :null=>false
      t.string :last_name, :null=>false
      t.string :picutre_url, :null=>true
      t.date :birthdate, :null=>false
      t.references :parent, index: true, :null=>false

      t.timestamps
    end
  end
end
