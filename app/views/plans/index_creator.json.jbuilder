
json.(@plans) do |plan|
  json.extract! plan, :id, :name, :description, :creator_id
  # json.creator_username plan.athletes.username ##NoMethodError username
  # json.creator_username plan.athletes(:username)  ##shows all attributes for athlete
  json.creator_username plan.athletes.pluck(:username) ##shows username in an array
  # json.creator_username current_athlete.username  #undefined variable or method current_athlete
  # json.(@plan.athlete_plans.athletes, :username) ##NoMethodError athlete

  json.workouts plan.workouts.pluck(:id)
  json.state_date plan.athlete_plans.pluck(:start_date)
  json.end_date plan.athlete_plans.pluck(:end_date)

end

