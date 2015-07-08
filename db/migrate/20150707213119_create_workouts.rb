class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :time
      t.string :image_url
      t.string :video_url
      t.boolean :running
      t.boolean :weightlifting
    end
  end
end
