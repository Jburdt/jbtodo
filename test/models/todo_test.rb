require "test_helper"

class TodoTest < ActiveSupport::TestCase

  test "should not save todo without task" do 
    todo = Todo.new
    assert_not(todo.save, ["Todo needs can not be blank"])
  end

  test "valid if the reminder is less than the todo" do 
    @todo = Todo.new(task: "test2", due_on: Date.today, remind_at: 2.days.from_now)
    @todo.valid?
   end

end
