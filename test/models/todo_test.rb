require "test_helper"

class TodoTest < ActiveSupport::TestCase

  test "should not save todo without task" do 
    @todo = Todo.new
    assert_not(@todo.save, ["Todo needs can not be blank"])
  end

  test "valid if the reminder is less than the todo" do 
    @todo = todos("invalid") # Grabbed the invalid data from fixtures
    refute @todo.valid?
    @todo.remind_at = @todo.due_on - 15.minutes 
    assert @todo.valid?
  end

  test "enum is set to new" do
    @todo = todos("new_task") # Grabbed the new_task data from fixtures
    assert @todo.valid?
    @todo.status = "complete"
    assert @todo.valid?
    assert_raises ArgumentError do
      @todo.status = "notvaild"
    end
  end

end
