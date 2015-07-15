class AddUsernameToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :workout_creator, :string
  end
end
