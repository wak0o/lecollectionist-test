require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = Shop.create(name: "Auchan")
  end
  it "is valid with valid attributes" do
    expect(Shop.new(name: "Carrefour")).to be_valid
  end
  it "is not valid without a name" do
    expect(Shop.new(name: nil)).to_not be_valid
  end
  it "is not valid without a unique name" do
    expect(Shop.new(name: "Auchan")).to_not be_valid
  end
  
end