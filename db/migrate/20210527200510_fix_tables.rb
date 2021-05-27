class FixTables < ActiveRecord::Migration[6.1]
  def change
    remove_reference :communities, :owner
    add_column :community_members, :owner, :boolean, default: false, null: false
  end
end
