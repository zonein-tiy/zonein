class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :type
      t.datetime :start_date
      t.datetime :end_date
      t.integer :workout_interval
      t.boolean :completion
      t.string :created_by
    end
  end
end
