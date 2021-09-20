require "test_helper"

class ShopTest < ActiveSupport::TestCase
  test "should not save article without name" do
    shop = Shop.new
    assert_not shop.save, "Saved the shop without a title"
  end
end
