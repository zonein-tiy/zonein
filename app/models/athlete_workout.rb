class AthleteWorkout < ActiveRecord::Base
  belongs_to :workout
  belongs_to :athlete
end