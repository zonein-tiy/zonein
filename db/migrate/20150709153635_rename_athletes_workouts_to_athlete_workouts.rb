class RenameAthletesWorkoutsToAthleteWorkouts < ActiveRecord::Migration
  def self.up
    rename_table :athletes_workouts, :athlete_workouts
  end 
  def self.down
    rename_table :athlete_workouts, :athletes_workouts
  end
end
