class AddTargetIdToNotices < ActiveRecord::Migration[6.1]
  def change
    add_column :notices, :target_id, :integer
  end
end
