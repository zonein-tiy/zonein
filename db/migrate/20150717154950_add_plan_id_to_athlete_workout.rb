class AddPlanIdToAthleteWorkout < ActiveRecord::Migration
  def change
    add_column :athlete_workouts, :plan_id, :integer
  end
end
