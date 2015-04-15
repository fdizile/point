class AddSettingHideOthersToUser < ActiveRecord::Migration
  def change
  	add_column :users, :setting_hide_others, :boolean, default: true
  end
end
