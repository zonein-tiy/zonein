class RemoveColumnFromWorkouts < ActiveRecord::Migration
  def change
    remove_column :workouts, :description
  end
end
