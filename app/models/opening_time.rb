class OpeningTime < ApplicationRecord
  validates :week_day, :open_at, :close_at, presence: true
  validates :week_day, inclusion: { in: 0..6, message: "%{value} is not a valid day" }
  validate :opens_before_closes, :availability

  belongs_to :shop

  def day_of_week
    Date::DAYNAMES[read_attribute(:week_day)]
  end

  protected

  def availability
    errors.add(:close_at, "Time range already exist") if OpeningTime.where("open_at <= :a AND :b <= close_at AND week_day = :c AND shop_id = :d", a: close_at, b: open_at, c: week_day, d: shop.id).exists?
  end

  def opens_before_closes
    errors.add(:close_at, "Open time must be before close time") if open_at && close_at && open_at >= close_at
  end

end
