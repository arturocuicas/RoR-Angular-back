class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :position
      t.string :area
      t.string :world
      t.integer :family_goal_id

      t.timestamps
    end
  end
end
