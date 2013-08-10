class CreateCateogries < ActiveRecord::Migration
  def change
    create_table :cateogries do |t|
      t.string :name
      t.string :description
      t.references :category, index: true

      t.timestamps
    end
  end
end
