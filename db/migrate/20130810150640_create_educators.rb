class CreateEducators < ActiveRecord::Migration
  def change
    create_table :educators do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
