class CreatePracePolozkas < ActiveRecord::Migration
  def change
    create_table :prace_polozkas do |t|
      t.integer :osoba_id
      t.integer :projekt_id
      t.date :datum
      t.text :obsah
      t.integer :hodiny

      t.timestamps
    end
  end
end
