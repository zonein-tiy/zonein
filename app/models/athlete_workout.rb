class AthleteWorkout < ActiveRecord::Base
  has_many :workouts
  belongs_to :athlete
end