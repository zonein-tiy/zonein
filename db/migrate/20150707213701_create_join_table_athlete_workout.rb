class CreateJoinTableAthleteWorkout < ActiveRecord::Migration
  def change
    create_join_table :athletes, :workouts do |t|
      # t.index [:athlete_id, :workout_id]
      # t.index [:workout_id, :athlete_id]
    end
  end
end
