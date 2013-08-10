class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :user, index: true, :null=>false

      t.timestamps
    end
  end
end
