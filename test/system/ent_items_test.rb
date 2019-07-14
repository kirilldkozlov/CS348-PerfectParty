require "application_system_test_case"

class EntItemsTest < ApplicationSystemTestCase
  setup do
    @ent_item = ent_items(:one)
  end

  test "visiting the index" do
    visit ent_items_url
    assert_selector "h1", text: "Ent Items"
  end

  test "creating a Ent item" do
    visit ent_items_url
    click_on "New Ent Item"

    fill_in "Ent", with: @ent_item.ent_id
    fill_in "Id", with: @ent_item.id
    fill_in "Item", with: @ent_item.item_id
    fill_in "Ord", with: @ent_item.ord
    fill_in "Quantity", with: @ent_item.quantity
    click_on "Create Ent item"

    assert_text "Ent item was successfully created"
    click_on "Back"
  end

  test "updating a Ent item" do
    visit ent_items_url
    click_on "Edit", match: :first

    fill_in "Ent", with: @ent_item.ent_id
    fill_in "Id", with: @ent_item.id
    fill_in "Item", with: @ent_item.item_id
    fill_in "Ord", with: @ent_item.ord
    fill_in "Quantity", with: @ent_item.quantity
    click_on "Update Ent item"

    assert_text "Ent item was successfully updated"
    click_on "Back"
  end

  test "destroying a Ent item" do
    visit ent_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ent item was successfully destroyed"
  end
end
