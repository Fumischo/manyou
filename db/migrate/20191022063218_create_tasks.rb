class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null:false
      t.text :description
      t.datetime :deadline
      t.integer :priority, null:false, default:0

      t.timestamps
    end
  end
end
      

