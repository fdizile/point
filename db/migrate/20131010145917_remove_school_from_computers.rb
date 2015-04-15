class RemoveSchoolFromComputers < ActiveRecord::Migration
  def change
  	remove_column :computers, :school
  end
end
