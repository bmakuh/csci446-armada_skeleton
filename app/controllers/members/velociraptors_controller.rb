class Members::VelociraptorsController < Members::MembersController
  before_filter :find_velociraptor
  
  def index
    @velociraptors = Velociraptor.paginate :per_page => 10, :page => params[:page]
    respond_to do |format|
      format.html
      format.xml { render :xml => @velociraptors }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @velociraptors }
      format.js
    end
  end

  def new
    @velociraptor = Velociraptor.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @velociraptor }
    end
  end

  def create
    @velociraptor = Velociraptor.new(params[:velociraptor])
    @velociraptor.creator_id = current_user.id
    respond_to do |format|
      if @velociraptor.save
        flash[:notice] = "Successfully created velociraptor."
        format.html { redirect_to members_velociraptor_path(@velociraptor) }
        format.xml  { render :xml => @velociraptor, :status => :created, :location => @velociraptor }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @velociraptor, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @velociraptor = Velociraptor.find(params[:id])
    if !@velociraptor.creator.eql?(current_user)
      flash[:error] = "You do not have access to this page."
      redirect_to members_velociraptors_path
    end
  end

  def update
    respond_to do |format|
      if @velociraptor.update_attributes(params[:velociraptor])
        flash[:notice] = "Successfully updated velociraptor."
        format.html { redirect_to members_velociraptor_path(@velociraptor) }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @velociraptor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @velociraptor.destroy
        flash[:notice] = "Successfully destroyed velociraptor."
        format.html { redirect_to members_velociraptors_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Velociraptor could not be destroyed.'
        format.html { redirect_to @velociraptor }
        format.xml  { head :unprocessable_entity }
      end
    end
  end
  
  private
    def find_velociraptor
      @velociraptor = Velociraptor.find(params[:id]) if params[:id]
    end
end
