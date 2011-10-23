class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :middle_name

  validates :first_name, :last_name, :middle_name, :presence => true

  attr_writer :accessible

  symbolize :role, :in => [:admin, :student, :clerk], :allow_nil => true

  before_save :assign_role

  def accessible
    @accessible ||= []
  end

  def full_name
    [last_name, first_name, middle_name].join(' ')
  end

  def abbr_name
    "#{last_name} #{first_name.first}. #{middle_name.first}."
  end


  protected

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

  private

  def mass_assignment_authorizer(role = :default)
    super(:default) + accessible
  end

  def assign_role
    if !persisted? && role.nil?
      self.role = :student
    end

    true
  end
end
