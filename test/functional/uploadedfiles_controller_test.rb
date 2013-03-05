require 'test_helper'

class UploadedfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uploadedfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uploadedfile" do
    assert_difference('Uploadedfile.count') do
      post :create, :uploadedfile => { }
    end

    assert_redirected_to uploadedfile_path(assigns(:uploadedfile))
  end

  test "should show uploadedfile" do
    get :show, :id => uploadedfiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => uploadedfiles(:one).to_param
    assert_response :success
  end

  test "should update uploadedfile" do
    put :update, :id => uploadedfiles(:one).to_param, :uploadedfile => { }
    assert_redirected_to uploadedfile_path(assigns(:uploadedfile))
  end

  test "should destroy uploadedfile" do
    assert_difference('Uploadedfile.count', -1) do
      delete :destroy, :id => uploadedfiles(:one).to_param
    end

    assert_redirected_to uploadedfiles_path
  end
end
