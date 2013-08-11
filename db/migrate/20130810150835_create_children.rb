class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name, :null=>false
      t.string :last_name, :null=>false
      t.string :picture_url, :null=>true
      t.string :address, :null=>true
      t.string :educational_setting, :null=>false
      t.date :birthdate, :null=>false
      t.references :parent, index: true, :null=>false

      t.timestamps
    end
  end
end
