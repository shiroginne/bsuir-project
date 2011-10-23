class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(@user.role.presence || :member) if @user
  end

  def member
    can :index, :home
  end

  def student
    member
  end

  def clerk
    member
  end

  def admin
    can :read, :admin_dash
    can :manage, :all
    cannot :destroy, @user
    cannot :assign_role, @user
  end
end
