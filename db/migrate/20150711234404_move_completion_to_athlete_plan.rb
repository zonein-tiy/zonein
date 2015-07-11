class MoveCompletionToAthletePlan < ActiveRecord::Migration
  def change
    remove_column :plans, :completion
  end
end
