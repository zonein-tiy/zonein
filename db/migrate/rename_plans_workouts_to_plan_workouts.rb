class RenamePlansWorkoutsToPlanWorkouts< ActiveRecord::Migration
  def self.up
    rename_table :plans_workouts, :plan_workouts
  end 
  def self.down
    rename_table :plan_workouts, :plans_workouts
  end
end