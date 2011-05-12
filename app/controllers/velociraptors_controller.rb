class VelociraptorsController < ApplicationController
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
      format.xml {render :xml => @velociraptors}
    end
  end

  def create
    @velociraptor = Velociraptor.new(params[:velociraptor])
    respond_to do |format|
      if @velociraptor.save
        flash[:notice] = "Successfully bred raptor."
        format.html {redirect_to @velociraptor}
        format.xml {render :xml => @velociraptor, :status => :created}
      else
        format.html {render :action => 'new'}
        format.xml {render :xml => @velociraptor.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def update
    @velociraptor = Velociraptor.find(params[:id])
    respond_to do |format|
      if @velociraptor.update_attributes(params[:velociraptor])
        flash[:notice] = "Successfully updated raptor."
        format.html {redirect_to @velociraptor}
        format.xml {head :ok}
      else
        format.html {render :action => 'edit'}
        format.xml {render :xml => @velociraptor.errors, :status => :unprocessable_entity}
      end
    end
  end
end
