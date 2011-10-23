class Faculty < ActiveRecord::Base
  validates :full_name, :abbr_name, :presence => true, :uniqueness => true
end
