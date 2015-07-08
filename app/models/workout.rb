class Workout < ActiveRecord::Base
  belongs_to :plan
  belongs_to :athlete_workout
end
