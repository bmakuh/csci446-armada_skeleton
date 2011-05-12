class Admin::VelociraptorsController < Admin::AdminController
  def index
    @velociraptors = Velociraptor.paginate :per_page => 10, :page => params[:page]
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @velociraptors}
    end
  end

  def show
    @velociraptor = Velociraptor.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @velociraptor}
    end
  end

  def new
    @velociraptor = Velociraptor.new
    respond_to do |format|
      format.html
      format.xml {render :xml => @velociraptor}
    end
  end

  def create
    @velociraptor = Velociraptor.new(params[:velociraptor])
    respond_to do |format|
      if @velociraptor.save
        flash[:notice] = "Successfully bred raptor."
        format.html {redirect_to admin_velociraptor_path(@velociraptor)}
        format.xml  {render :xml => @velociraptor}
      else
        format.html {render :action => "new"}
        format.xml {render :xml => @velociraptor.errors, :status => :unprocessable_entity}
      end
    end
  end

  def edit
    @velociraptor = Velociraptor.find(params[:id])
  end

  def update
    @velociraptor = Velociraptor.find(params[:id])
    respond_to do |format|
      if @velociraptor.update_attributes(params[:velociraptor])
        flash[:notice] = "Successfully updated raptor."
        format.html {redirect_to admin_velociraptor_path(@velociraptor)}
        format.xml  {head :ok}
      else
        format.html {render :action => 'edit'}
        format.xml {render :xml => @velociraptor.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @velociraptor = Velociraptor.find(params[:id])
    respond_to do |format|
      if @velociraptor.destroy
        flash[:notice] = "Successfully destroyed raptor."
        format.html {redirect_to admin_velociraptors_path}
        format.xml {head :ok}
      else
        flash[:notice] = "Missile could not be destroyed."
        format.html {redirect_to members_velociraptor_url(@velociraptor)}
        format.xml {head :unprocessable_entity}
      end
    end
  end
end
