class CreateProjekts < ActiveRecord::Migration
  def change
    create_table :projekts do |t|
      t.string :nazev
      t.integer :kod

      t.timestamps
    end
  end
end
