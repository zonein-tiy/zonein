class AddIdColumnToApJoin < ActiveRecord::Migration
  def change
    add_column :athlete_workouts, :id, :primary_key
  end
end
