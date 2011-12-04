class SpecialitySubjectTerm < ActiveRecord::Base
  belongs_to :subject
  belongs_to :term
  belongs_to :speciality

  has_many :marks

  validates :subject, :speciality, :term, :presence => true
end
