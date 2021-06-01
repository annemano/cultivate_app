class CreateCommunityRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :community_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
