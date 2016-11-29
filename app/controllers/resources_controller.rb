class ResourcesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    
    if @resource.save
      flash[:notice] = "The resource #{@resource.title} has been uploaded."
      redirect_to resources_path#, notice: 
    else
      render "new"
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    flash[:notice] = "The resource #{@resource.title} has been deleted."
    redirect_to resources_path#, notice: "The resource #{@resource.name} has been deleted."
  end
  
  private
  
  def resource_params
    params.require(:resource).permit(:title, :attachment)
  end

end
