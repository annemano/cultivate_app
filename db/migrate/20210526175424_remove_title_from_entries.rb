class RemoveTitleFromEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :title, :string
  end
end
