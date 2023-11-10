class Todo < ApplicationRecord
  belongs_to :user
  enum status: { incomplete: "new", complete: "complete" }
  validates :status, inclusion: { in: statuses.keys }
  validates :task, presence: true
  validates :remind_at, comparison: { less_than: :due_on }

  include PgSearch::Model

  pg_search_scope :global_search, against: [:task], using: { tsearch: { prefix: true } }
end
