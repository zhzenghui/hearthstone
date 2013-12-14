require 'test_helper'

class CardPagesControllerTest < ActionController::TestCase
  setup do
    @card_page = card_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_page" do
    assert_difference('CardPage.count') do
      post :create, card_page: { link: @card_page.link, name: @card_page.name }
    end

    assert_redirected_to card_page_path(assigns(:card_page))
  end

  test "should show card_page" do
    get :show, id: @card_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_page
    assert_response :success
  end

  test "should update card_page" do
    patch :update, id: @card_page, card_page: { link: @card_page.link, name: @card_page.name }
    assert_redirected_to card_page_path(assigns(:card_page))
  end

  test "should destroy card_page" do
    assert_difference('CardPage.count', -1) do
      delete :destroy, id: @card_page
    end

    assert_redirected_to card_pages_path
  end
end
