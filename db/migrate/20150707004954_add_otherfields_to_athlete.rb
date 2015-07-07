class AddOtherfieldsToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :zip, :integer
    add_column :athletes, :phone_number, :string
  end
end
