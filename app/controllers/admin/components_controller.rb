class Admin::ComponentsController < Admin::AdminController
  def index
    @components = Component.paginate :per_page => 10, :page => params[:page]
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
  end

  def create
    @component = Component.new(params[:component])
    if @component.save
      flash[:notice] = "Successfully created component."
      redirect_to admin_component_path(@component)
    else
      render :action => 'new'
    end
  end

  def edit
    @component = Component.find(params[:id])
  end

  def update
    @component = Component.find(params[:id])
    if @component.update_attributes(params[:component])
      flash[:notice] = "Successfully updated component."
      redirect_to admin_component_path(@component)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy
    flash[:notice] = "Successfully destroyed component."
    redirect_to admin_components_path
  end
end
