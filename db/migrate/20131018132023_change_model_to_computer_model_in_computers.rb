class ChangeModelToComputerModelInComputers < ActiveRecord::Migration
  def change
  	rename_column :computers, :model, :computer_model
  end
end
