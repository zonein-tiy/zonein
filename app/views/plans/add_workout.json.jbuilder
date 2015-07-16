# json.(@rticle, :id)
# json.athleteworkout do |json|
#    json.(@athlete_workout, :id, :athlete_id, :workout_id, :workout_completion, :do_date) 
# end
json.array! @plan_workout
json.array! @athlete_workout
# json.plan_id(@plan, :id)
# json.athleteworkout do
#   json.array! @athlete_workout.map(&:id)
# end
# json.planworkout do
#   json.array!plan_workout, :workout_id
# end

# json.array! @plan_workout

# json.athleteworkout_id(@athlete_workout, :id)
# json.planworkout_id(@plan_workout, :id)


# json.post_id @plan.id
# json.athlete_workout_id @athlete_workout.id
# json.workouts do
#  json.array! @plan.workouts.map(&:id)
# end

# json.(@plan_id) #workouts, :plan_id, :name, :description, :creator_id)
# json.(@planworkouts, :workout_id)
# json.(@planworkouts, :id, :name, :description, :creator_id)

# json.plan_id(@planworkouts.plan_id) do
#   json.array! @planworkouts, :workout_id  
# end

# json.(@planworkouts.pluck(:plan_id))
# json.plan_id(@plan_id)

# json do |workout|
#   json.workout workout.workout_id
# end
  # rjson.plan_workout @planworkout do |p|
#   json.workout_id plan_workout.workout_id
# end

# json.attachments @message.attachments do |attachment|
#   json.filename attachment.filename

#     "attachments": [
#     { "filename": "forecast.xls", "url": "http://example.com/downloads/forecast.xls" },
#     { "filename": "presentation.pdf", "url": "http://example.com/downloads/presentation.pdf" }
#   ]