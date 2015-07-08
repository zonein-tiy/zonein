class ChangeColumnNameInWorkouts < ActiveRecord::Migration
  def change
     rename_column :workouts, :type, :description
  end
end
