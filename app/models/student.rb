class Student < ActiveRecord::Base
  belongs_to :group
  has_one :speciality, :through => :group
  has_one :faculty, :through => :group

  has_many :marks
  has_many :subjects, :through => :speciality

  validates :first_name, :last_name, :middle_name, :group, :presence => true
end
