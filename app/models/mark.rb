class Mark < ActiveRecord::Base
  belongs_to :student
  belongs_to :speciality_subject_term

  has_one :subject, :through => :speciality_subject_term
  has_one :term, :through => :speciality_subject_term


  validates :value, :presence => true, :numericality => {:greater_than_or_equal_to => 0, :less_then_or_equal_to => 10}
end
