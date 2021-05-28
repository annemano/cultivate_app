class AddMoodToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :mood, :integer
  end
end
