class AddMatricsToAthleteWorkout < ActiveRecord::Migration
  def change
    add_column :athlete_workouts, :lift_weight, :integer
    add_column :athlete_workouts, :lift_reps, :integer
    add_column :athlete_workouts, :run_distance, :integer
    add_column :athlete_workouts, :run_time, :integer
  end
end
