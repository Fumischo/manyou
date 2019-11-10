class CreateLabelings < ActiveRecord::Migration[5.2]
  def change
    create_table :labelings do |t|
      t.references :task
      t.references :label

      t.timestamps
    end
  end
end
