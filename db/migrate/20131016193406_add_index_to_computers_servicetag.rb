class AddIndexToComputersServicetag < ActiveRecord::Migration
  def change
  	add_index :computers, :servicetag, unique: true
  end
end
