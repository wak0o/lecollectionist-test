# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p "Remove Data"

OpeningTime.delete_all
Shop.delete_all

p "Creating Shop"
shop = Shop.create(name: Faker::Restaurant.unique.name)
p "Shop created"

p "Creating Opening Times"
opening_time = OpeningTime.create(week_day: 1, week_day_name: "Monday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 1, week_day_name: "Monday", open_at: "2000-01-01 17:00:00.000000000 +0000", close_at: "2000-01-01 20:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 2, week_day_name: "Tuesday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 2, week_day_name: "Tuesday", open_at: "2000-01-01 17:00:00.000000000 +0000", close_at: "2000-01-01 20:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 3, week_day_name: "Wednesday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 3, week_day_name: "Wednesday", open_at: "2000-01-01 17:00:00.000000000 +0000", close_at: "2000-01-01 20:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 4, week_day_name: "Thursday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 4, week_day_name: "Thursday", open_at: "2000-01-01 17:00:00.000000000 +0000", close_at: "2000-01-01 20:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 5, week_day_name: "Friday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 15:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 5, week_day_name: "Friday", open_at: "2000-01-01 17:00:00.000000000 +0000", close_at: "2000-01-01 20:00:00.000000000 +0000", shop: shop)
opening_time = OpeningTime.create(week_day: 6, week_day_name: "Saturday", open_at: "2000-01-01 10:30:00.000000000 +0000", close_at: "2000-01-01 20:00:00.000000000 +0000", shop: shop)
p "Opening times created"