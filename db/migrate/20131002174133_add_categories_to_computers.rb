class AddCategoriesToComputers < ActiveRecord::Migration
  def change
  	add_column :computers, :category, :string
  end
end
