json.(@plan, :name, :description)
json.(@athleteplan, :id, :plan_id, :start_date, :end_date, :completion)
json.workouts @athlete_workout, :workout_id, :do_date
# json.(@athlete_workout, :workout_id)