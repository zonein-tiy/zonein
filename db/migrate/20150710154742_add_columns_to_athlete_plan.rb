class AddColumnsToAthletePlan < ActiveRecord::Migration
  def change
    add_column :athlete_plans, :start_date, :string
    add_column :athlete_plans, :end_date, :string
  end
end
