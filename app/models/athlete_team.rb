class AthleteTeam < ActiveRecord::Base
  has_many :athletes
  belongs_to :team
end
