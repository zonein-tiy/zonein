class AddColumnToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :creator_id, :integer
  end
end
