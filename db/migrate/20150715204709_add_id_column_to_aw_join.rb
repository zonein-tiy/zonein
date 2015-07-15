class AddIdColumnToAwJoin < ActiveRecord::Migration
  def change
      add_column :athlete_plans, :id, :primary_key
  end
end
