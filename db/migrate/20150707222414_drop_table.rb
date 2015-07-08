class DropTable < ActiveRecord::Migration
  def change
      drop_table :athletes_teams
  end
end
