class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.references :category, index: true

      t.timestamps
    end
  end
end
