require "application_system_test_case"

class DecorItemsTest < ApplicationSystemTestCase
  setup do
    @decor_item = decor_items(:one)
  end

  test "visiting the index" do
    visit decor_items_url
    assert_selector "h1", text: "Decor Items"
  end

  test "creating a Decor item" do
    visit decor_items_url
    click_on "New Decor Item"

    fill_in "Decor", with: @decor_item.decor_id
    fill_in "Id", with: @decor_item.id
    fill_in "Item", with: @decor_item.item_id
    fill_in "Quantity", with: @decor_item.quantity
    click_on "Create Decor item"

    assert_text "Decor item was successfully created"
    click_on "Back"
  end

  test "updating a Decor item" do
    visit decor_items_url
    click_on "Edit", match: :first

    fill_in "Decor", with: @decor_item.decor_id
    fill_in "Id", with: @decor_item.id
    fill_in "Item", with: @decor_item.item_id
    fill_in "Quantity", with: @decor_item.quantity
    click_on "Update Decor item"

    assert_text "Decor item was successfully updated"
    click_on "Back"
  end

  test "destroying a Decor item" do
    visit decor_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Decor item was successfully destroyed"
  end
end
