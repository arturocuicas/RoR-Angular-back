class CreateFamilyGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :family_goals do |t|
      t.string :name
      t.string :position
      t.string :area
      t.string :world

      t.timestamps
    end
  end
end
