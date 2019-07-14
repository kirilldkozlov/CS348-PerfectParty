require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { attendees: @event.attendees, client_id: @event.client_id, date: @event.date, decor_id: @event.decor_id, ent_id: @event.ent_id, id: @event.id, menu_id: @event.menu_id, venue_id: @event.venue_id } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { attendees: @event.attendees, client_id: @event.client_id, date: @event.date, decor_id: @event.decor_id, ent_id: @event.ent_id, id: @event.id, menu_id: @event.menu_id, venue_id: @event.venue_id } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
