class AddContentToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :content, :text
  end
end
