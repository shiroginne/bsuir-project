class Admin::UsersController < Admin::AdminBaseController
  load_and_authorize_resource
  before_filter :accessible, :only => [:create, :update]

  def create
    @user.attributes = params[:user]
    @user.confirmed_at = Time.now
    @user.save
    respond_with @user, :location => [:admin, @user]
  end

  def update
    @user.attributes = params[:user]
    @user.save
    respond_with @user, :location => [:admin, @user]
  end

  def destroy
    @user.destroy
    respond_with @user, :location => [:admin, :users]
  end

  private

  def accessible
    @user.accessible << :role if can? :assign_role, @user
  end
end
