class CreateViews < ActiveRecord::Migration[6.1]
  def change
    create_table :views do |t|
      t.integer :viewable_id

      t.timestamps
    end
  end
end
