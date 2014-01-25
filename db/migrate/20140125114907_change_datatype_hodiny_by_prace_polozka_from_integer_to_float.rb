class ChangeDatatypeHodinyByPracePolozkaFromIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :prace_polozkas, :hodiny, :float
  end
end
