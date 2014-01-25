class RemoveJmenoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :osoba_id, :integer
  end
end
