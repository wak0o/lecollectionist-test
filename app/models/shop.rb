class Shop < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :opening_times, dependent: :destroy
end
