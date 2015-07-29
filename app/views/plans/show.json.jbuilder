json.array!(@athlete_workouts) do |workout|
  json.plan @plan.plan_id
  json.workout_id workout.workout_id
  json.workout workout.do_date
end

  # @athlete_workouts, :workout_id, :do_date
# json.extract! @plan, :id, :athlete_id, :plan_id
# json.extract! @plan.plan, :name
# # json.workouts @workouts, :name
# json.dates @dates, :workout_id, :do_date

# json.workouts @plan.plan.workouts do |json, workout|
#   json.(workout, :id)
# end
