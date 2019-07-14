require 'test_helper'

class SupplierItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplier_item = supplier_items(:one)
  end

  test "should get index" do
    get supplier_items_url
    assert_response :success
  end

  test "should get new" do
    get new_supplier_item_url
    assert_response :success
  end

  test "should create supplier_item" do
    assert_difference('SupplierItem.count') do
      post supplier_items_url, params: { supplier_item: { cost: @supplier_item.cost, id: @supplier_item.id, item_id: @supplier_item.item_id, quantity: @supplier_item.quantity, supplier_id: @supplier_item.supplier_id } }
    end

    assert_redirected_to supplier_item_url(SupplierItem.last)
  end

  test "should show supplier_item" do
    get supplier_item_url(@supplier_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_item_url(@supplier_item)
    assert_response :success
  end

  test "should update supplier_item" do
    patch supplier_item_url(@supplier_item), params: { supplier_item: { cost: @supplier_item.cost, id: @supplier_item.id, item_id: @supplier_item.item_id, quantity: @supplier_item.quantity, supplier_id: @supplier_item.supplier_id } }
    assert_redirected_to supplier_item_url(@supplier_item)
  end

  test "should destroy supplier_item" do
    assert_difference('SupplierItem.count', -1) do
      delete supplier_item_url(@supplier_item)
    end

    assert_redirected_to supplier_items_url
  end
end
