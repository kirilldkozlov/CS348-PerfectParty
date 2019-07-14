require "application_system_test_case"

class MenuItemsTest < ApplicationSystemTestCase
  setup do
    @menu_item = menu_items(:one)
  end

  test "visiting the index" do
    visit menu_items_url
    assert_selector "h1", text: "Menu Items"
  end

  test "creating a Menu item" do
    visit menu_items_url
    click_on "New Menu Item"

    fill_in "Id", with: @menu_item.id
    fill_in "Item", with: @menu_item.item_id
    fill_in "Menu", with: @menu_item.menu_id
    fill_in "Quantity", with: @menu_item.quantity
    click_on "Create Menu item"

    assert_text "Menu item was successfully created"
    click_on "Back"
  end

  test "updating a Menu item" do
    visit menu_items_url
    click_on "Edit", match: :first

    fill_in "Id", with: @menu_item.id
    fill_in "Item", with: @menu_item.item_id
    fill_in "Menu", with: @menu_item.menu_id
    fill_in "Quantity", with: @menu_item.quantity
    click_on "Update Menu item"

    assert_text "Menu item was successfully updated"
    click_on "Back"
  end

  test "destroying a Menu item" do
    visit menu_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Menu item was successfully destroyed"
  end
end
