class AddCompletionToAthletePlan < ActiveRecord::Migration
  def change
    add_column :athlete_plans, :completion, :boolean, :default => false
  end
end
