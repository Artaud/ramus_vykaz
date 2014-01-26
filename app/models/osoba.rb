class Osoba < ActiveRecord::Base
  has_many :prace_polozkas
  has_one :user
  accepts_nested_attributes_for :user, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
end
