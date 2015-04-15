class ChangeCodeTypeInSchools < ActiveRecord::Migration
  def change
  	change_column :schools, :code, :string, :default => "none"
  end
end
