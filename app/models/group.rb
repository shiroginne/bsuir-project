class Group < ActiveRecord::Base
  belongs_to :speciality

  validates :number, :presence => true, :numericality => true, :length => {:is => 6}
  validates :speciality, :presence => true
end
