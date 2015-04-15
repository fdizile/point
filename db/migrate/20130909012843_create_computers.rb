class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :acpsnumber
      t.string :bpinumber
      t.string :make
      t.string :model
      t.string :os
      t.string :room

      t.timestamps
    end
  end
end
