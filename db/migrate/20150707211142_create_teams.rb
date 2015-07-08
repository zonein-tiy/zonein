class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :sport
      t.string :image_url
      t.datetime :season_start
      t.datetime :season_end
      t.string :city
      t.string :state
    end
  end
end
