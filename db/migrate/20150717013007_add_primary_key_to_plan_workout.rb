class AddPrimaryKeyToPlanWorkout < ActiveRecord::Migration
  def change
  add_column :plan_workouts, :id, :primary_key
  end
end
