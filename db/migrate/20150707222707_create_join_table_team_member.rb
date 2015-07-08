class CreateJoinTableTeamMember < ActiveRecord::Migration
  def change
    create_join_table :teams, :athletes do |t|
      # t.index [:team_id, :athlete_id]
      # t.index [:athlete_id, :team_id]
    end
  end
end
