class Speciality < ActiveRecord::Base
  belongs_to :faculty

  validates :full_name, :abbr_name, :presence => true, :uniqueness => true
  validates :faculty, :presence => true
end
