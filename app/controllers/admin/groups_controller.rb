class Admin::GroupsController < Admin::AdminBaseController
  load_and_authorize_resource

  def create
    @group.attributes = params[:group]
    @group.save
    respond_with @group, :location => [:admin, @group]
  end

  def update
    @group.attributes = params[:group]
    @group.save
    respond_with @group, :location => [:admin, @group]
  end

  def destroy
    @group.destroy
    respond_with @group, :location => [:admin, :groups]
  end
end
