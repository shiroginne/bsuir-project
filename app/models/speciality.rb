class Speciality < ActiveRecord::Base
  belongs_to :faculty
  has_many :groups, :dependent => :destroy
  has_many :students, :through => :groups
  has_many :marks, :through => :students
  has_many :speciality_subject_terms
  has_many :subjects, :through => :speciality_subject_terms, :uniq => true
  has_many :terms, :through => :speciality_subject_terms, :uniq => true

  validates :full_name, :abbr_name, :presence => true, :uniqueness => true
  validates :faculty, :presence => true
end
