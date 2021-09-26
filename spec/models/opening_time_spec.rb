require 'rails_helper'

RSpec.describe OpeningTime, type: :model do
  before do
    @shop = Shop.create(name: "Auchan")
    @opening_time = OpeningTime.create(week_day: 5, week_day_name: "Friday", open_at: "2000-01-01 8:30:00.000000000 +0000", close_at: "2000-01-01 21:00:00.000000000 +0000", shop: @shop)
  end
  it "is valid with valid attributes" do
    expect(OpeningTime.new(week_day: 1, week_day_name: "Monday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: @shop)).to be_valid
  end
  it "is not valid without a week_day" do
    expect(OpeningTime.new(week_day: nil, week_day_name: "Monday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  it "is not valid without a valid week_day" do
    expect(OpeningTime.new(week_day: 42, week_day_name: "Monday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  it "is not valid without a week_day_name" do
    expect(OpeningTime.new(week_day: 1, week_day_name: nil, open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  it "is not valid without a valid week_day_name" do
    expect(OpeningTime.new(week_day: 1, week_day_name: "Sunnyday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  it "is not valid without a opening time" do
    expect(OpeningTime.new(week_day: 1, week_day_name: "Monday", open_at: nil, close_at: "2000-01-01 15:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  it "is not valid without a closing time" do
    expect(OpeningTime.new(week_day: 1, week_day_name: "Monday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: nil, shop: @shop)).to_not be_valid
  end
  it "is not valid if closing time is earlier than opening time" do
    expect(OpeningTime.new(week_day: 1, week_day_name: "Monday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 8:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  it "is not valid if time range already exist in another opening time" do
    expect(OpeningTime.new(week_day: 5, week_day_name: "Friday", open_at: "2000-01-01 11:30:00.000000000 +0000", close_at: "2000-01-01 16:00:00.000000000 +0000", shop: @shop)).to_not be_valid
  end
  
end