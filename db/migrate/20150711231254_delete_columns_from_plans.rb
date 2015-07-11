class DeleteColumnsFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :created_by
  end
end
