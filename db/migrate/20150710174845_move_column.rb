class MoveColumn < ActiveRecord::Migration
  def change
    remove_column :athlete_plans, :workout_interval
    add_column :plan_workouts, :workout_interval, :integer
  end
end
