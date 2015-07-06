class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :home_address
      t.string :city
      t.string :state
      t.string :image_url
      t.string :interests

      t.timestamps null: false
    end
  end
end
