require "test_helper"

class OpeningTimeTest < ActiveSupport::TestCase
  test "should not save Opening Time without week day" do
    opening_time = OpeningTime.new(shop: Shop.first, open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 17:00:00.000000000 +0000")
    assert_not opening_time.save, "Saved the opening time without a week day"
  end
  test "should not save Opening Time without open time" do
    opening_time = OpeningTime.new(shop: Shop.first, week_day: 1, close_at: "2000-01-01 17:00:00.000000000 +0000")
    assert_not opening_time.save, "Saved the opening time without a open time"
  end
  test "should not save Opening Time without closing time" do
    opening_time = OpeningTime.new(shop: Shop.first, week_day: 1, open_at: "2000-01-01 10:30:00.000000000 +0000")
    assert_not opening_time.save, "Saved the opening time without closing time"
  end
end
