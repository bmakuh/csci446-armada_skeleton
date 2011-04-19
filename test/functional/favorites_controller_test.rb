require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Favorite.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Favorite.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Favorite.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to favorite_url(assigns(:favorite))
  end

  def test_edit
    get :edit, :id => Favorite.first
    assert_template 'edit'
  end

  def test_update_invalid
    Favorite.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Favorite.first
    assert_template 'edit'
  end

  def test_update_valid
    Favorite.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Favorite.first
    assert_redirected_to favorite_url(assigns(:favorite))
  end

  def test_destroy
    favorite = Favorite.first
    delete :destroy, :id => favorite
    assert_redirected_to favorites_url
    assert !Favorite.exists?(favorite.id)
  end
end
