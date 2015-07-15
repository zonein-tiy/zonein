class AddUsernameToPlans < ActiveRecord::Migration
  def change
        add_column :plans, :plan_creator, :string
  end
end
