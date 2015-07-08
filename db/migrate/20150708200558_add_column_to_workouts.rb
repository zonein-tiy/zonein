class AddColumnToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :steps, :text
  end
end
