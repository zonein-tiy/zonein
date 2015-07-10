class AddMetricColumnsToAthlete < ActiveRecord::Migration
  def change
    add_column :workouts, :swimming, :boolean, :default => false
    add_column :workouts, :circuit_training, :boolean, :default => false
    add_column :workouts, :cycling, :boolean, :default => false
  end
end
