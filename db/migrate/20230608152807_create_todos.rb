class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :task
      t.datetime :due_on
      t.datetime :remind_at

      t.timestamps
    end
  end
end
