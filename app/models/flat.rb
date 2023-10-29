class Flat < ApplicationRecord
  validates :name, :address, :description, :price_per_night, :number_of_guest, presence: true
  validates :price_per_night, :number_of_guest, numericality: { only_integer: true }
end
