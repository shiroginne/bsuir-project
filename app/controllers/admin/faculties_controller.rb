class Admin::FacultiesController < Admin::AdminBaseController
  load_and_authorize_resource

  def create
    @faculty.attributes = params[:faculty]
    @faculty.save
    respond_with @faculty, :location => [:admin, @faculty]
  end

  def update
    @faculty.attributes = params[:faculty]
    @faculty.save
    respond_with @faculty, :location => [:admin, @faculty]
  end

  def destroy
    @faculty.destroy
    respond_with @faculty, :location => [:admin, :faculties]
  end
end
