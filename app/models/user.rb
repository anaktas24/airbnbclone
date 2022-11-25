class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy # user's listings refer to their tools/listings on offer to other users
  has_many :bookings, dependent: :destroy # user's bookings refer to the tools/listings that they have requested/agreed to borrow
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
