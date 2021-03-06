class Members::FavoritesController < Members::MembersController
  def index
    @favorites = Favorite.find_all_by_user_id(current_user.id)
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
    velociraptor_id = params[:format]
    velociraptor = velociraptor.find(velociraptor_id)
    
    respond_to do |format|    
      if !current_user.is_favorite?(velociraptor)
        Favorite.create(:user_id => current_user.id, :velociraptor_id => params[:format])
        format.js if request.xhr?
        format.html { redirect_to :back }
      else
        favorite = Favorite.find_by_user_id_and_velociraptor_id(current_user.id, velociraptor_id)
        favorite.destroy
        format.js if request.xhr?
        format.html { redirect_to :back }
      end
    end
  end
end
