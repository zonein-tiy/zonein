class ChangeColumnInWorkouts < ActiveRecord::Migration
  def change
    change_column :workouts, :running, :boolean, :default => false
    change_column :workouts, :weightlifting, :boolean, :default => false
  end
end
