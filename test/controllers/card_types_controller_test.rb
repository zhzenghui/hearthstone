require 'test_helper'

class CardTypesControllerTest < ActionController::TestCase
  setup do
    @card_type = card_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_type" do
    assert_difference('CardType.count') do
      post :create, card_type: { link: @card_type.link, name: @card_type.name }
    end

    assert_redirected_to card_type_path(assigns(:card_type))
  end

  test "should show card_type" do
    get :show, id: @card_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_type
    assert_response :success
  end

  test "should update card_type" do
    patch :update, id: @card_type, card_type: { link: @card_type.link, name: @card_type.name }
    assert_redirected_to card_type_path(assigns(:card_type))
  end

  test "should destroy card_type" do
    assert_difference('CardType.count', -1) do
      delete :destroy, id: @card_type
    end

    assert_redirected_to card_types_path
  end
end
