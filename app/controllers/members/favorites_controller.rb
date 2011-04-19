class Members::FavoritesController < Members::MembersController
  def index
    @favorites = Favorite.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @favorites }
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @favorite }
      format.js
    end
  end

  def created
    @favorite = Favorite.new(params[:favorite])
    respond_to do |format|
      if @favorite.save
        flash[:notice] = "Successfully created favorite."
        format.html { redirect_to members_favorite_url(@favorite) }
        format.xml { render :xml => @favorite, :status => :created, :location => @favorite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        flash[:notice] = "Successfully updated favorite."
        format.html { redirect_to members_favorite_url(@favorite) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      if @favorite.destroy
        flash[:success] = "You're a dick. But we did remove 'em from favorites for you."        
        format.html { redirect_to members_favorites_path }
        format.xml  { head :ok }
      else
        flash[:error] = "That raptor couldn't be destroyed. Try again later, though."
        format.html { redirect_to members_favorite_url(@favorite) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end
  
  def toggle
    component_id = params[:format]
    component = Component.find(component_id)
    
    if !current_user.is_favorite?(component)
      Favorite.create(:user_id => current_user.id, :component_id => params[:format])
    else
      favorite = Favorite.find_by_user_id_and_component_id(current_user.id, component_id)
      favorite.destroy
    end
    redirect_to :back
  end
end
