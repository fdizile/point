class AddServicetagToComputers < ActiveRecord::Migration
  def change
  	add_column :computers, :servicetag, :string
  end
end
