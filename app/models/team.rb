class Team < ActiveRecord::Base
  has_many :athletes, through: :athletes_teams
end

