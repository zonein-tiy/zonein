class RenameColumnInPlan < ActiveRecord::Migration
  def change
    rename_column :plans, :type, :description
  end
end
