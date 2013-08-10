class AddPictureUrlToChildren < ActiveRecord::Migration
  def change
    add_column :children, :picutre_url, :string
  end
end
