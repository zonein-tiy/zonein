class AddDefaultToWorkoutCompletion < ActiveRecord::Migration
  def change
    change_column :athlete_workouts, :workout_completion, :boolean, :default => false
  end
end
