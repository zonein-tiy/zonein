# json.@plans
# json.@plan_workouts
# json.extract! @plans, :id, :name
# json.extract! @plan_workouts, :workout_id
# json.plans do |json|
#    json.(@plans, :id, :name)
# end 
# json.plans @plans, :id, :name
# json.workouts @plan_workouts, :plan_id, :workout_id
# json.plan do |json|
#   json.(@plans, :id, :name, :description)
# end
# json.(@planworkouts)
json.(@plans) do |plan|
  json.extract! plan, :id, :name, :description, :creator_id, :plan_creator
  # json.creator_username plan.athletes.pluck(:username)
  json.workouts plan.workouts.pluck(:id)
  # json.state_date plan.athlete_plans.pluck(:start_date)
  # json.end_date plan.athlete_plans.pluck(:end_date)
end