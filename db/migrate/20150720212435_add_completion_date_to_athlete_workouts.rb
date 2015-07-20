class AddCompletionDateToAthleteWorkouts < ActiveRecord::Migration
  def change
    add_column :athlete_workouts, :completion_date, :string
  end
end
