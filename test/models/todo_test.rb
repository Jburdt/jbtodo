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
    def setup
      @todo = Todo.new(task: "test2", due_on: Fri, 30 Jun 2024 10:41:00.000000000 UTC +00:00, remind_at: Fri, 31 Jun 2023 00:43:00.000000000 UTC +00:00)
    end

  end

end
