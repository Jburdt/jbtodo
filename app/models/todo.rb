class Todo < ApplicationRecord
  validates :task, presence: true
  validates :remind_at, comparison: { less_than: :due_on }
end
