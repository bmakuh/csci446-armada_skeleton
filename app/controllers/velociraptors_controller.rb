class VelociraptorsController < ApplicationController
  def index
    @velociraptors = Velociraptor.paginate :per_page => 10, :page => params[:page]
  end

  def show
    @velociraptor = Velociraptor.find(params[:id])
  end

  def create
    @velociraptor = Velociraptor.new(params[:velociraptor])
    if @velociraptor.save
      flash[:notice] = "Successfully bred raptor."
      redirect_to @velociraptor
    else
      render :action => 'new'
    end
  end
  
  def update
    @velociraptor = Velociraptor.find(params[:id])
    if @velociraptor.update_attributes(params[:velociraptor])
      flash[:notice] = "Successfully updated raptor."
      redirect_to @velociraptor
    else
      render :action => 'edit'
    end
  end
end
