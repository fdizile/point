class AddIndexToComputersAcpsnumber < ActiveRecord::Migration
  def change
  	add_index :computers, :acpsnumber, unique: true
  end
end
