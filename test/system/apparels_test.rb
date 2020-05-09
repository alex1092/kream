require "application_system_test_case"

class ApparelsTest < ApplicationSystemTestCase
  setup do
    @apparel = apparels(:one)
  end

  test "visiting the index" do
    visit apparels_url
    assert_selector "h1", text: "Apparels"
  end

  test "creating a Apparel" do
    visit apparels_url
    click_on "New Apparel"

    fill_in "Brand", with: @apparel.brand
    fill_in "Model", with: @apparel.model
    fill_in "Price", with: @apparel.price
    fill_in "Size", with: @apparel.size
    click_on "Create Apparel"

    assert_text "Apparel was successfully created"
    click_on "Back"
  end

  test "updating a Apparel" do
    visit apparels_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @apparel.brand
    fill_in "Model", with: @apparel.model
    fill_in "Price", with: @apparel.price
    fill_in "Size", with: @apparel.size
    click_on "Update Apparel"

    assert_text "Apparel was successfully updated"
    click_on "Back"
  end

  test "destroying a Apparel" do
    visit apparels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Apparel was successfully destroyed"
  end
end
