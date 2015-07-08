class CreateJoinTableAthletePlan < ActiveRecord::Migration
  def change
    create_join_table :athletes, :plans do |t|
      # t.index [:athlete_id, :plan_id]
      # t.index [:plan_id, :athlete_id]
    end
  end
end
