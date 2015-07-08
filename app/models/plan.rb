class Plan < ActiveRecord::Base
  has_many :workouts
  belongs_to :athlete, through: :athletes_plans
end