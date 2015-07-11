class ChangeColumnInPlan < ActiveRecord::Migration
  def change
    change_column :plans, :completion, :boolean, :default => false
  end
end
