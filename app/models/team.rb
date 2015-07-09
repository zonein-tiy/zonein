class Team < ActiveRecord::Base
  has_many :athlete_teams
  has_many :athletes, through: :athlete_teams

  belongs_to :athlete_team

  belongs_to :coach, class_name: 'Athlete'
end

