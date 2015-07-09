class RenameAthletesTeamsToAtheleteTeams< ActiveRecord::Migration
  def self.up
    rename_table :athletes_teams, :athlete_teams
  end 
  def self.down
    rename_table :athlete_teams, :athletes_teams
  end
end