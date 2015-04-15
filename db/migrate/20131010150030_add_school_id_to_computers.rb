class AddSchoolIdToComputers < ActiveRecord::Migration
  def change
  	add_column :computers, :school_id, :integer
  end
end
