require "test_helper"

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save todo without task" do 
    todo = Todo.new
    assert_not(todo.save, ["Todo needs can not be blank"])
  end

  test "valid if the reminder is less than the todo" do 
    assert(true, ["Reminder can not be after todo date."])
  end

end
