class Shop < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :opening_times, dependent: :destroy

  def is_open(day)
    if self.opening_times.find_by(week_day_name: Date::DAYNAMES[day])
      return true
    end
  end

end
