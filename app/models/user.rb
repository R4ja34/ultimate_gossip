class User < ApplicationRecord
  belongs_to :city

  has_many :publications
  has_many :comments

  has_secure_password
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
  presence: true,
  # uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "You need an email address to proceed. It's mandatory." }
end
