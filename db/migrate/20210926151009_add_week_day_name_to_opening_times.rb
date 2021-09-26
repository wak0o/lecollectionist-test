class AddWeekDayNameToOpeningTimes < ActiveRecord::Migration[6.1]
  def change
    add_column :opening_times, :week_day_name, :string
  end
end
