class Athlete < ActiveRecord::Base
  # EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # validates :password, :access_token, presence: true
  # validates :email, uniqueness: true, presence: true
  # validates :email, format: { with: EMAIL_REGEX,
  #                             message: "is not a valid email" }
  # validates :username, uniqueness: true, presence: true

  before_validation :ensure_access_token

      # has_many :plans
      # has_many :workouts, through: :plans

  def ensure_access_token
    if self.access_token.blank?
      self.access_token = Athlete.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while Athlete.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
