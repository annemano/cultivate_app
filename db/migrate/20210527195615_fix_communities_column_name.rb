class FixCommunitiesColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :communities, :user_id, :owner_id
  end
end
