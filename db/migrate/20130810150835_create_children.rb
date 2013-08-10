class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.references :parents, index: true

      t.timestamps
    end
  end
end
