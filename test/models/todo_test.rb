require "test_helper"

class TodoTest < ActiveSupport::TestCase

  test "should not save todo without task" do 
    todo = Todo.new
    assert_not(todo.save, ["Todo needs can not be blank"])
  end

  test "valid if the reminder is less than the todo" do 
    @todo = todos("invalid")
    refute @todo.valid?
    @todo.remind_at = @todo.due_on - 15.minutes 
    assert @todo.valid?
  end

  test "enum is set to new" do
    @todo = todos("new_task")
    assert @todo.valid?
    @todo.status = "complete"
    assert @todo.valid?
    @todo.status = "notvaild"
    refute @todo.valid?
  end

end
