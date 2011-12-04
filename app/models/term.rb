class Term < ActiveRecord::Base
  has_many :specialiy_subject_terms
  has_many :subjects, :through => :specialiy_subject_terms, :uniq => true
  has_many :marks, :through => :specialiy_subject_terms
end
