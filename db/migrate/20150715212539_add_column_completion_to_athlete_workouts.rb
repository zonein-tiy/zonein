class AddColumnCompletionToAthleteWorkouts < ActiveRecord::Migration
  def change
    add_column :athlete_workouts, :workout_completion, :boolean
  end
end
