class RenameUserColumnToUsername < ActiveRecord::Migration
  def change
  	rename_column :computers, :user, :username
  end
end
