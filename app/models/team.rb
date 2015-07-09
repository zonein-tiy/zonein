class Team < ActiveRecord::Base
  has_many :athlete_teams
  has_many :athletes, through: :athlete_teams
end

