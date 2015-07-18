class Plan < ActiveRecord::Base
  has_many :athlete_plans
  has_many :athletes, through: :athlete_plans

  has_many :plan_workouts, dependent: :destroy
  has_many :workouts, through: :plan_workouts

  # belongs_to :athlete_plan
  # belongs_to :plan_workout

  belongs_to :creator, class_name: 'Athlete'
end