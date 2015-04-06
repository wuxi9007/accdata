require 'test_helper'

class UserDataFilesControllerTest < ActionController::TestCase
  setup do
    @user_data_file = user_data_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_data_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_data_file" do
    assert_difference('UserDataFile.count') do
      post :create, user_data_file: { filename: @user_data_file.filename }
    end

    assert_redirected_to user_data_file_path(assigns(:user_data_file))
  end

  test "should show user_data_file" do
    get :show, id: @user_data_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_data_file
    assert_response :success
  end

  test "should update user_data_file" do
    patch :update, id: @user_data_file, user_data_file: { filename: @user_data_file.filename }
    assert_redirected_to user_data_file_path(assigns(:user_data_file))
  end

  test "should destroy user_data_file" do
    assert_difference('UserDataFile.count', -1) do
      delete :destroy, id: @user_data_file
    end

    assert_redirected_to user_data_files_path
  end
end
