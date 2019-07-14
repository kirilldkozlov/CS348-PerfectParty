require 'test_helper'

class DecorItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decor_item = decor_items(:one)
  end

  test "should get index" do
    get decor_items_url
    assert_response :success
  end

  test "should get new" do
    get new_decor_item_url
    assert_response :success
  end

  test "should create decor_item" do
    assert_difference('DecorItem.count') do
      post decor_items_url, params: { decor_item: { decor_id: @decor_item.decor_id, id: @decor_item.id, item_id: @decor_item.item_id, quantity: @decor_item.quantity } }
    end

    assert_redirected_to decor_item_url(DecorItem.last)
  end

  test "should show decor_item" do
    get decor_item_url(@decor_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_decor_item_url(@decor_item)
    assert_response :success
  end

  test "should update decor_item" do
    patch decor_item_url(@decor_item), params: { decor_item: { decor_id: @decor_item.decor_id, id: @decor_item.id, item_id: @decor_item.item_id, quantity: @decor_item.quantity } }
    assert_redirected_to decor_item_url(@decor_item)
  end

  test "should destroy decor_item" do
    assert_difference('DecorItem.count', -1) do
      delete decor_item_url(@decor_item)
    end

    assert_redirected_to decor_items_url
  end
end
