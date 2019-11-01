class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :deadline, null: false
      t.integer :priority, null: false, default:0
      t.integer :status, null: false, default:0

      t.timestamps

      t.index ["name"], name: "index_tasks_on_name"
      t.index ["status"], name: "index_tasks_on_status"
      t.index ["priority"], name: "index_tasks_on_priority"
    end
  end
end
  