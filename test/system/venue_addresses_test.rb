require "application_system_test_case"

class VenueAddressesTest < ApplicationSystemTestCase
  setup do
    @venue_address = venue_addresses(:one)
  end

  test "visiting the index" do
    visit venue_addresses_url
    assert_selector "h1", text: "Venue Addresses"
  end

  test "creating a Venue address" do
    visit venue_addresses_url
    click_on "New Venue Address"

    fill_in "Address", with: @venue_address.address_id
    fill_in "Id", with: @venue_address.id
    fill_in "Venue", with: @venue_address.venue_id
    click_on "Create Venue address"

    assert_text "Venue address was successfully created"
    click_on "Back"
  end

  test "updating a Venue address" do
    visit venue_addresses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @venue_address.address_id
    fill_in "Id", with: @venue_address.id
    fill_in "Venue", with: @venue_address.venue_id
    click_on "Update Venue address"

    assert_text "Venue address was successfully updated"
    click_on "Back"
  end

  test "destroying a Venue address" do
    visit venue_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Venue address was successfully destroyed"
  end
end
