class Speciality < ActiveRecord::Base
  belongs_to :faculty
  has_many :groups, :dependent => :destroy

  validates :full_name, :abbr_name, :presence => true, :uniqueness => true
  validates :faculty, :presence => true
end
