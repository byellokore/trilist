require "application_system_test_case"

class LocalesTest < ApplicationSystemTestCase
  setup do
    @locale = locales(:one)
  end

  test "visiting the index" do
    visit locales_url
    assert_selector "h1", text: "Locales"
  end

  test "creating a Locale" do
    visit locales_url
    click_on "New Locale"

    fill_in "Address", with: @locale.address
    fill_in "City", with: @locale.city
    fill_in "Name", with: @locale.name
    fill_in "Zip code", with: @locale.zip_code
    click_on "Create Locale"

    assert_text "Locale was successfully created"
    click_on "Back"
  end

  test "updating a Locale" do
    visit locales_url
    click_on "Edit", match: :first

    fill_in "Address", with: @locale.address
    fill_in "City", with: @locale.city
    fill_in "Name", with: @locale.name
    fill_in "Zip code", with: @locale.zip_code
    click_on "Update Locale"

    assert_text "Locale was successfully updated"
    click_on "Back"
  end

  test "destroying a Locale" do
    visit locales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Locale was successfully destroyed"
  end
end
