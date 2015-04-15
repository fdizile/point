class AddCommentAndStatusToComputers < ActiveRecord::Migration
  def change
  	add_column :computers, :comment, :text
  	add_column :computers, :status, :text
  end
end
