class Admin::VelociraptorsController < Admin::AdminController
  def index
    @velociraptors = Velociraptor.paginate :per_page => 10, :page => params[:page]
  end

  def show
    @velociraptor = Velociraptor.find(params[:id])
  end

  def new
    @velociraptor = Velociraptor.new
  end

  def create
    @velociraptor = Velociraptor.new(params[:velociraptor])
    if @velociraptor.save
      flash[:notice] = "Successfully bred raptor."
      redirect_to admin_velociraptor_path(@velociraptor)
    else
      render :action => 'new'
    end
  end

  def edit
    @velociraptor = Velociraptor.find(params[:id])
  end

  def update
    @velociraptor = Velociraptor.find(params[:id])
    if @velociraptor.update_attributes(params[:velociraptor])
      flash[:notice] = "Successfully updated raptor."
      redirect_to admin_velociraptor_path(@velociraptor)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @velociraptor = Velociraptor.find(params[:id])
    @velociraptor.destroy
    flash[:notice] = "Successfully destroyed raptor."
    redirect_to admin_velociraptors_path
  end
end
