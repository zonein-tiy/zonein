class RenameAthletesPlansToAthletePlans < ActiveRecord::Migration
  def self.up
    rename_table :athletes_plans, :athlete_plans
  end 
  def self.down
    rename_table :athlete_plans, :athletes_plans
  end
end
