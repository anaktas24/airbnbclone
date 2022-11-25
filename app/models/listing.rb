class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :delete_all
  has_one_attached :photo

  validates :name, presence: true
  validates :name, format: { with: /\A(?!^\d+$)/ }
  validates :name, length: { minimum: 3 }
  validates :name, length: { maximum: 30 }
  validates :description, presence: true
  validates :description, format: { with: /\A(?!^\d+$)/ }
  validates :description, length: { minimum: 3 }
  validates :description, length: { maximum: 500 }
  validates :price_per_hour, presence: true
  validates :price_per_hour, numericality: { greater_than_or_equal_to: 0 }
  validates :location, presence: true
  validates :location, format: { with: /\A(?!^\d+$)/ }
  validates :location, length: { minimum: 4 }
  validates :location, length: { maximum: 50 }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
