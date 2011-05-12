require 'test_helper'

class velociraptorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => velociraptor.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    velociraptor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    velociraptor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to velociraptor_url(assigns(:velociraptor))
  end

  def test_edit
    get :edit, :id => velociraptor.first
    assert_template 'edit'
  end

  def test_update_invalid
    velociraptor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => velociraptor.first
    assert_template 'edit'
  end

  def test_update_valid
    velociraptor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => velociraptor.first
    assert_redirected_to velociraptor_url(assigns(:velociraptor))
  end

  def test_destroy
    velociraptor = velociraptor.first
    delete :destroy, :id => velociraptor
    assert_redirected_to velociraptors_url
    assert !velociraptor.exists?(velociraptor.id)
  end
end
