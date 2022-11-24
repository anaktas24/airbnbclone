class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  #! TO DO - validate dates to be in future and end_date >= start_date
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending rejected confirmed expired) }
end
