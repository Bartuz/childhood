class CreateEducators < ActiveRecord::Migration
  def change
    create_table :educators do |t|
      t.references :user, index: true, :null=>false

      t.timestamps
    end
  end
end
