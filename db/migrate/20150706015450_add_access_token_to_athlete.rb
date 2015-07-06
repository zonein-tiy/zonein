class AddAccessTokenToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :access_token, :string
  end
end
