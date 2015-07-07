class AddColumnPasswordToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :password, :string
  end
end
