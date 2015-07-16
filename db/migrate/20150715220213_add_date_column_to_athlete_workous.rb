class AddDateColumnToAthleteWorkous < ActiveRecord::Migration
  def change
    add_column :athlete_workouts, :do_date, :string
  end
end
