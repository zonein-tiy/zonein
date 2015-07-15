json.array! @workouts, :id, :creator_id, :name, :description, :time, :steps, :image_url, :video_url, :running, :weightlifting, :swimming, :circuit_training, :cycling
# json.creator_username plan.athlete_plans.athletes.pluck(:username)
# json.creator do |json|
#   json.(@workouts.creator, :username)
# end
# json.creator_username @workouts.creator.pluck(:username)