require 'test_helper'

class VenueAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venue_address = venue_addresses(:one)
  end

  test "should get index" do
    get venue_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_venue_address_url
    assert_response :success
  end

  test "should create venue_address" do
    assert_difference('VenueAddress.count') do
      post venue_addresses_url, params: { venue_address: { address_id: @venue_address.address_id, id: @venue_address.id, venue_id: @venue_address.venue_id } }
    end

    assert_redirected_to venue_address_url(VenueAddress.last)
  end

  test "should show venue_address" do
    get venue_address_url(@venue_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_venue_address_url(@venue_address)
    assert_response :success
  end

  test "should update venue_address" do
    patch venue_address_url(@venue_address), params: { venue_address: { address_id: @venue_address.address_id, id: @venue_address.id, venue_id: @venue_address.venue_id } }
    assert_redirected_to venue_address_url(@venue_address)
  end

  test "should destroy venue_address" do
    assert_difference('VenueAddress.count', -1) do
      delete venue_address_url(@venue_address)
    end

    assert_redirected_to venue_addresses_url
  end
end
