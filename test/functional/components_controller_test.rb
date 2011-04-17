require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Component.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Component.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Component.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to component_url(assigns(:component))
  end

  def test_edit
    get :edit, :id => Component.first
    assert_template 'edit'
  end

  def test_update_invalid
    Component.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Component.first
    assert_template 'edit'
  end

  def test_update_valid
    Component.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Component.first
    assert_redirected_to component_url(assigns(:component))
  end

  def test_destroy
    component = Component.first
    delete :destroy, :id => component
    assert_redirected_to components_url
    assert !Component.exists?(component.id)
  end
end
