class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_enum :todo_status, %w(new complete)
    create_table :todos do |t|
      t.string :task
      t.datetime :due_on
      t.datetime :remind_at
      t.enum :status, enum_type: "todo_status", default: "new", null: false

      t.timestamps
    end
  end
end
