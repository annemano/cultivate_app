class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.user :references

      t.timestamps
    end
  end
end
