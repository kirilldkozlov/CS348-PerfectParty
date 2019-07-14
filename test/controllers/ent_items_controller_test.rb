require 'test_helper'

class EntItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ent_item = ent_items(:one)
  end

  test "should get index" do
    get ent_items_url
    assert_response :success
  end

  test "should get new" do
    get new_ent_item_url
    assert_response :success
  end

  test "should create ent_item" do
    assert_difference('EntItem.count') do
      post ent_items_url, params: { ent_item: { ent_id: @ent_item.ent_id, id: @ent_item.id, item_id: @ent_item.item_id, ord: @ent_item.ord, quantity: @ent_item.quantity } }
    end

    assert_redirected_to ent_item_url(EntItem.last)
  end

  test "should show ent_item" do
    get ent_item_url(@ent_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_ent_item_url(@ent_item)
    assert_response :success
  end

  test "should update ent_item" do
    patch ent_item_url(@ent_item), params: { ent_item: { ent_id: @ent_item.ent_id, id: @ent_item.id, item_id: @ent_item.item_id, ord: @ent_item.ord, quantity: @ent_item.quantity } }
    assert_redirected_to ent_item_url(@ent_item)
  end

  test "should destroy ent_item" do
    assert_difference('EntItem.count', -1) do
      delete ent_item_url(@ent_item)
    end

    assert_redirected_to ent_items_url
  end
end
