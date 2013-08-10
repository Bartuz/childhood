class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null=>false
      t.string :description, :null=>true

      t.timestamps
    end

    add_reference :categories, :parent_category, index: true
  end
end
