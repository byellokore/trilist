require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Address", with: @event.address
    fill_in "Close to registration", with: @event.close_to_registration
    fill_in "Contacts", with: @event.contacts
    fill_in "Inviter", with: @event.inviter_id
    fill_in "Name", with: @event.name
    fill_in "Open to registration", with: @event.open_to_registration
    fill_in "Seo url", with: @event.seo_url
    fill_in "Short url", with: @event.short_url
    fill_in "Will happen", with: @event.will_happen
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Address", with: @event.address
    fill_in "Close to registration", with: @event.close_to_registration
    fill_in "Contacts", with: @event.contacts
    fill_in "Inviter", with: @event.inviter_id
    fill_in "Name", with: @event.name
    fill_in "Open to registration", with: @event.open_to_registration
    fill_in "Seo url", with: @event.seo_url
    fill_in "Short url", with: @event.short_url
    fill_in "Will happen", with: @event.will_happen
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
