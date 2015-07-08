class Athlete < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password, presence: true
  # , length: {minimum: 6}
  validates_length_of :password, minimum: 8
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: EMAIL_REGEX,
                              message: "is not a valid email" }
  validates :username, uniqueness: true, presence: true
  validates :access_token, presence: true

  before_validation :ensure_access_token
  before_save :encrypt_password

  has_many :teams, through: :athletes_teams
  belongs_to :athlete_team
  has_many :plans, through: :athletes_plans
  has_many :workouts, through: :athletes_workouts


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

  private
  def encrypt_password
    # if we don't have a hashed password, hash it!
    digested = self.password.length == 40
    self.update(password: Digest::SHA1.hexdigest(self.password)) unless digested
  end
end
