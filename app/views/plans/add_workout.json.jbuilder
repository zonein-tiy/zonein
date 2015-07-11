# json.(@plan_id) #workouts, :plan_id, :name, :description, :creator_id)
# json.(@planworkouts, :workout_id)
# json.(@planworkouts, :id, :name, :description, :creator_id)

# json.plan_id(@planworkouts.plan_id) do
#   json.array! @planworkouts, :workout_id  
# end

# json.(@planworkouts.pluck(:plan_id))
# json.plan_id(@plan_id)

 json.array! @planworkouts, :plan_id, :workout_id
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