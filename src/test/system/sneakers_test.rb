require "application_system_test_case"

class SneakersTest < ApplicationSystemTestCase
  setup do
    @sneaker = sneakers(:one)
  end

  test "visiting the index" do
    visit sneakers_url
    assert_selector "h1", text: "Sneakers"
  end

  test "creating a Sneaker" do
    visit sneakers_url
    click_on "New Sneaker"

    fill_in "Brand", with: @sneaker.brand
    fill_in "Model", with: @sneaker.model
    fill_in "Price", with: @sneaker.price
    fill_in "Size", with: @sneaker.size
    click_on "Create Sneaker"

    assert_text "Sneaker was successfully created"
    click_on "Back"
  end

  test "updating a Sneaker" do
    visit sneakers_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @sneaker.brand
    fill_in "Model", with: @sneaker.model
    fill_in "Price", with: @sneaker.price
    fill_in "Size", with: @sneaker.size
    click_on "Update Sneaker"

    assert_text "Sneaker was successfully updated"
    click_on "Back"
  end

  test "destroying a Sneaker" do
    visit sneakers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sneaker was successfully destroyed"
  end
end
