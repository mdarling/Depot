    require 'test_helper'

class WishItemsControllerTest < ActionController::TestCase
  setup do
    @wish_item = wish_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wish_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wish_item" do
    assert_difference('WishItem.count') do
        post :create, :product_id => products(:ruby).id
    end

  end

  test "should show wish_item" do
    get :show, id: @wish_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wish_item.to_param
    assert_response :success
  end

  test "should update wish_item" do
    put :update, id: @wish_item.to_param, wish_item: @wish_item.attributes
    assert_redirected_to wish_item_path(assigns(:wish_item))
  end

  test "should destroy wish_item" do
    assert_difference('WishItem.count', -1) do
      delete :destroy, id: @wish_item.to_param
    end

    assert_redirected_to wish_items_path
  end
end
