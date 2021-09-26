class OpeningTime < ApplicationRecord
  validates :week_day, :week_day_name, :open_at, :close_at, presence: true
  validates :week_day, inclusion: { in: 0..6, message: "%{value} is not a valid week day" }
  validates :week_day_name, inclusion: { in: %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday), message: "%{value} is not a valid week day" }
  validate :opens_before_closes, :availability

  belongs_to :shop

  scope :schedule_of_day, ->(week_day_name){ 
    where(week_day_name: Date::DAYNAMES[week_day_name]).order(open_at: :asc) 
  }

  def day_of_week
    Date::DAYNAMES[read_attribute(:week_day)]
  end

  def opening_hours
    "#{self.open_at.strftime('%H:%M')}-#{self.close_at.strftime('%H:%M')}"
  end

  protected

  def availability
    errors.add(:close_at, "Time range already exist") if self.shop.opening_times.where("open_at <= :a AND :b <= close_at AND week_day = :c", a: close_at, b: open_at, c: week_day).exists?
  end

  def opens_before_closes
    errors.add(:close_at, "Open time must be before close time") if open_at && close_at && open_at >= close_at
  end

end
