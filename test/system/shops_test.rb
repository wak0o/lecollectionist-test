require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url # "/"
    assert_selector "h1", text: "Shops"
  end
end
