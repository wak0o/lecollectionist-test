class Shop < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :opening_times, dependent: :destroy
  accepts_nested_attributes_for :opening_times, allow_destroy: true

end
