ActiveRecord::Schema[7.0].define(version: 2023_06_08_152807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "todos", force: :cascade do |t|
    t.string "task"
    t.datetime "due_on"
    t.datetime "remind_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
