class PracePolozka < ActiveRecord::Base
  belongs_to :osoba
  belongs_to :projekt
  accepts_nested_attributes_for :osoba, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  accepts_nested_attributes_for :projekt, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  validates :hodiny, :numericality => { :greater_than_or_equal_to => 0}
  # validates :projekt_id, presence: true

end