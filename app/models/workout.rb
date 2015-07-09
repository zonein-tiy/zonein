class Workout < ActiveRecord::Base
  serialize :steps

  has_many :plan_workouts
  has_many :plans, through: :plan_workouts

  has_many :athlete_workouts
  has_many :athletes, through: :athlete_workouts


  #belongs_to :athlete_workout
  # add a creator_id column
  belongs_to :creator, class_name: 'Athlete'
end
