class Todo < ApplicationRecord
  enum status: { new: "new", complete: "complete" }
  validates :status, inclusion: { in: status.keys }
  validates :task, presence: true
  validates :remind_at, comparison: { less_than: :due_on }
end
