class ComponentsController < ApplicationController
  def index
    @components = Component.paginate :per_page => 10, :page => params[:page]
  end

  def show
    @component = Component.find(params[:id])
  end
end
