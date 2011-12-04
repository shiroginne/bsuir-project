class Admin::SpecialitiesController < Admin::AdminBaseController
  load_and_authorize_resource

  def create
    @speciality.attributes = params[:speciality]
    @speciality.save
    respond_with @speciality, :location => [:admin, @speciality]
  end

  def update
    @speciality.attributes = params[:speciality]
    @speciality.save
    respond_with @speciality, :location => [:admin, @speciality]
  end

  def destroy
    @speciality.destroy
    respond_with @speciality, :location => [:admin, :specialities]
  end
end
