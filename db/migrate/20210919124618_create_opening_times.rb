class CreateOpeningTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :opening_times do |t|
      t.time :open_at
      t.time :close_at
      t.integer :week_day
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
