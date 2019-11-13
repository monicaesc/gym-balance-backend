class User < ApplicationRecord
#  has_secure_password
#  before_save { self.email = email.downcase }
#  validates :name, presence: true, length: {minimum: 2, maximum: 50}
#  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#  validates :email, presence: true, length: {minimum: 2, maximum: 50},
#                    uniqueness: { case_sensitive: false},
#                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_many :user_klasses
  has_many :klasses, through: :user_klasses
end
