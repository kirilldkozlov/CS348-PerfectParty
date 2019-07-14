require "application_system_test_case"

class SupplierItemsTest < ApplicationSystemTestCase
  setup do
    @supplier_item = supplier_items(:one)
  end

  test "visiting the index" do
    visit supplier_items_url
    assert_selector "h1", text: "Supplier Items"
  end

  test "creating a Supplier item" do
    visit supplier_items_url
    click_on "New Supplier Item"

    fill_in "Cost", with: @supplier_item.cost
    fill_in "Id", with: @supplier_item.id
    fill_in "Item", with: @supplier_item.item_id
    fill_in "Quantity", with: @supplier_item.quantity
    fill_in "Supplier", with: @supplier_item.supplier_id
    click_on "Create Supplier item"

    assert_text "Supplier item was successfully created"
    click_on "Back"
  end

  test "updating a Supplier item" do
    visit supplier_items_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @supplier_item.cost
    fill_in "Id", with: @supplier_item.id
    fill_in "Item", with: @supplier_item.item_id
    fill_in "Quantity", with: @supplier_item.quantity
    fill_in "Supplier", with: @supplier_item.supplier_id
    click_on "Update Supplier item"

    assert_text "Supplier item was successfully updated"
    click_on "Back"
  end

  test "destroying a Supplier item" do
    visit supplier_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Supplier item was successfully destroyed"
  end
end
