class AthleteTeam < ActiveRecord::Base
  # TeamMember
  belongs_to :athlete
  belongs_to :team
end
