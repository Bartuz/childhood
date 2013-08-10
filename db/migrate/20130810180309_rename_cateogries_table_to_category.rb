class RenameCateogriesTableToCategory < ActiveRecord::Migration
  def change
  	rename_table :cateogries, :categories
  end
end
