class RemoveContentFromEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :content, :string
  end
end
