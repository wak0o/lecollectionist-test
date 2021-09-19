class OpeningTime < ApplicationRecord
  validates :week_day, :open_at, :close_at, presence: true
  validates :open_at, :close_at, uniqueness: true
  validates :week_day, inclusion: { in: 1..7, message: "%{value} is not a valid day" }
  validate :opens_before_closes 

  belongs_to :shop

  def day_of_week
    Date::DAYNAMES[read_attribute(:week_day)]
  end

  protected

  def opens_before_closes
    errors.add(:close_at, "Open time must be before close time") if open_at && close_at && open_at >= close_at
  end

end
