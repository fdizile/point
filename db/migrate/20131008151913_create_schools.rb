class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.string :abbreviation
    	t.integer :code
    	t.string :name
    	t.string :phone
    	t.string :address
    end
  end
end
