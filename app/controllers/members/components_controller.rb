class Members::ComponentsController < Members::MembersController
  before_filter :find_component
  
  def index
    @components = Component.paginate :per_page => 10, :page => params[:page]
    respond_to do |format|
      format.html
      format.xml { render :xml => @components }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @components }
      format.js
    end
  end

  def new
    @component = Component.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @component }
    end
  end

  def create
    @component = Component.new(params[:component])
    respond_to do |format|
      if @component.save
        flash[:notice] = "Successfully created velociraptor."
        format.html { redirect_to members_component_path(@component) }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @component, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = "Successfully updated velociraptor."
        format.html { redirect_to members_component_path(@component) }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @component.destroy
        flash[:notice] = "Successfully destroyed velociraptor."
        format.html { redirect_to members_components_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Velociraptor could not be destroyed.'
        format.html { redirect_to @component }
        format.xml  { head :unprocessable_entity }
      end
    end
  end
  
  private
    def find_component
      @component = Component.find(params[:id]) if params[:id]
    end
end
