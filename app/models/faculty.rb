class Faculty < ActiveRecord::Base
  has_many :specialities, :dependent => :destroy
  validates :full_name, :abbr_name, :presence => true, :uniqueness => true
end
