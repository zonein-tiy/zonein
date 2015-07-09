class PlanWorkout < ActiveRecord::Base
  belongs_to :plan
  belongs_to :workout
end