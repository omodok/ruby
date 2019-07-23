require "application_system_test_case"

class MeibosTest < ApplicationSystemTestCase
  setup do
    @meibo = meibos(:one)
  end

  test "visiting the index" do
    visit meibos_url
    assert_selector "h1", text: "Meibos"
  end

  test "creating a Meibo" do
    visit meibos_url
    click_on "New Meibo"

    fill_in "Denwa", with: @meibo.denwa
    fill_in "Jusyo", with: @meibo.jusyo
    fill_in "Shimei", with: @meibo.shimei
    click_on "Create Meibo"

    assert_text "Meibo was successfully created"
    click_on "Back"
  end

  test "updating a Meibo" do
    visit meibos_url
    click_on "Edit", match: :first

    fill_in "Denwa", with: @meibo.denwa
    fill_in "Jusyo", with: @meibo.jusyo
    fill_in "Shimei", with: @meibo.shimei
    click_on "Update Meibo"

    assert_text "Meibo was successfully updated"
    click_on "Back"
  end

  test "destroying a Meibo" do
    visit meibos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meibo was successfully destroyed"
  end
end
