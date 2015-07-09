class Plan < ActiveRecord::Base
  has_many :athlete_plans
  has_many :athletes, through: :athlete_plans

  has_many :plan_workouts
  has_many :workouts, through: :plan_workouts
end