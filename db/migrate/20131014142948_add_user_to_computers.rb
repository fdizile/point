class AddUserToComputers < ActiveRecord::Migration
  def change
  	add_column :computers, :user, :string
  end
end
