class ComponentsController < ApplicationController
  def index
    @components = Component.paginate :per_page => 10, :page => params[:page]
  end

  def show
    @component = Component.find(params[:id])
  end

  def create
    @component = Component.new(params[:component])
    if @component.save
      flash[:notice] = "Successfully bred raptor."
      redirect_to @component
    else
      render :action => 'new'
    end
  end
  
  def update
    @component = Component.find(params[:id])
    if @component.update_attributes(params[:component])
      flash[:notice] = "Successfully updated raptor."
      redirect_to @component
    else
      render :action => 'edit'
    end
  end
end
