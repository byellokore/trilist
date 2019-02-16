require "application_system_test_case"

class GuestsTest < ApplicationSystemTestCase
  setup do
    @guest = guests(:one)
  end

  test "visiting the index" do
    visit guests_url
    assert_selector "h1", text: "Guests"
  end

  test "creating a Guest" do
    visit guests_url
    click_on "New Guest"

    fill_in "Birthday", with: @guest.birthday
    fill_in "Cellphone", with: @guest.cellphone
    fill_in "Confirmation token", with: @guest.confirmation_token
    fill_in "Confirmed at", with: @guest.confirmed_at
    fill_in "Email", with: @guest.email
    fill_in "Event", with: @guest.event_id
    fill_in "Location", with: @guest.location
    fill_in "Name", with: @guest.name
    click_on "Create Guest"

    assert_text "Guest was successfully created"
    click_on "Back"
  end

  test "updating a Guest" do
    visit guests_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @guest.birthday
    fill_in "Cellphone", with: @guest.cellphone
    fill_in "Confirmation token", with: @guest.confirmation_token
    fill_in "Confirmed at", with: @guest.confirmed_at
    fill_in "Email", with: @guest.email
    fill_in "Event", with: @guest.event_id
    fill_in "Location", with: @guest.location
    fill_in "Name", with: @guest.name
    click_on "Update Guest"

    assert_text "Guest was successfully updated"
    click_on "Back"
  end

  test "destroying a Guest" do
    visit guests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guest was successfully destroyed"
  end
end
