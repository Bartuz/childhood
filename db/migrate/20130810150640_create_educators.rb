class CreateEducators < ActiveRecord::Migration
  def change
    create_table :educators do |t|

      t.timestamps
    end
  end
end
