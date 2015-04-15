class AddSchoolToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :school, :string
  end
end
