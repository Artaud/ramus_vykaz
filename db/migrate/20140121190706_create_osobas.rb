class CreateOsobas < ActiveRecord::Migration
  def change
    create_table :osobas do |t|
      t.string :jmeno
      t.string :prijmeni

      t.timestamps
    end
  end
end
