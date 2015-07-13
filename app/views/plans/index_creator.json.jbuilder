json.plans @plans do |plan|
  json.extract! plan, :id, :name, :description, :creator_id
  json.workouts plan.workouts.pluck(:id)
end
# json.(@plans, :name)
# json.(@plans, :name, :description)

# description)
  # , :description, :creator_id)

# json.array!@plans) do |json, plan|



# json.array!(@plans) do |json, plan|
#   # json.plan_id plan.plan_id
#   json.description plan.description
#   json.creator_id plan.creator_id
#   json.workouts plan.planworkouts.workout_id
#   json.start_date plan.athlete_plans.start_date
#   json.end_date plan.athlete_plans.end_date
#   json.completion plan.athlete_plans.completion
# end
  # , :name, :description, :creator_id
# json.array! @planworkouts, :workout_id
# json.array! @athleteplan, :start_date, :end_date, :completion


# json.name user.name

# json.array!(@reservations) do |json, reservation|
#     json.restaurant reservation.restaurant.name
#     json.reservation_time reservation.time

