class Subject < ActiveRecord::Base
  has_many :specialiy_subject_terms
  has_many :terms, :through => :specialiy_subject_terms, :uniq => true
  has_many :marks, :through => :specialiy_subject_terms
  has_many :specialities, :through => :specialiy_subject_terms, :uniq => true

  validates :full_name, :abbr_name, :presence => true
end
