class RemoveIntervalFromPlanWorkouts < ActiveRecord::Migration
  def change
    remove_column :plan_workouts, :workout_interval
  end
end
