require 'test_helper'

class HeroTypesControllerTest < ActionController::TestCase
  setup do
    @hero_type = hero_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hero_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hero_type" do
    assert_difference('HeroType.count') do
      post :create, hero_type: { link: @hero_type.link, name: @hero_type.name }
    end

    assert_redirected_to hero_type_path(assigns(:hero_type))
  end

  test "should show hero_type" do
    get :show, id: @hero_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hero_type
    assert_response :success
  end

  test "should update hero_type" do
    patch :update, id: @hero_type, hero_type: { link: @hero_type.link, name: @hero_type.name }
    assert_redirected_to hero_type_path(assigns(:hero_type))
  end

  test "should destroy hero_type" do
    assert_difference('HeroType.count', -1) do
      delete :destroy, id: @hero_type
    end

    assert_redirected_to hero_types_path
  end
end
