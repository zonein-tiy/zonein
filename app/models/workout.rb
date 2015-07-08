class Workout < ActiveRecord::Base
  serialize :steps
  belongs_to :plan
  belongs_to :athlete_workout
end
