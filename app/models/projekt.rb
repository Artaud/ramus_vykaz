class Projekt < ActiveRecord::Base
  has_many :prace_polozkas

  # def sum_by_month(month, year)
  	# sum = 0
  	# return self.prace_polozkas.find(:all)
  	# self.sum(each (projekt.hodiny where datum is month, year)*60) # when changing hodinova mzda also change in prace_polozkas.js.coffee
  # end

end
