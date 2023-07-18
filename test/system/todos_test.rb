require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:new_task)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Todos"
  end

  test "should create todo" do
    visit todos_url
    click_on "New todo"

    fill_in "Due on", with: @todo.due_on.to_datetime
    fill_in "Remind at", with: @todo.remind_at.to_datetime
    fill_in "Task", with: @todo.task
    click_on "Create Todo"

    assert_text "Todo was successfully created"
    click_on "Back"
  end

  test "should update Todo" do
    visit todo_url(@todo)
    click_on "Edit this todo", match: :first

    fill_in "Due on", with: @todo.due_on.to_datetime
    fill_in "Remind at", with: @todo.remind_at.to_datetime
    fill_in "Task", with: @todo.task
    check 'Status'
    click_on "Update Todo"

    assert_text "Todo was successfully updated"
    @todo.reload
    assert @todo.status == "complete"
    click_on "Back"
  end

  test "should destroy Todo" do
    visit todo_url(@todo)
    click_on "Destroy this todo", match: :first

    assert_text "Todo was successfully destroyed"
  end
end
