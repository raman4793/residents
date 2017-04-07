class Blog < ApplicationRecord
  belongs_to :member
  has_many :notifications, as: :eventable

  default_scope { order(created_at: :desc)}

  def name
    title
  end

  after_create do
    activity = 'added a new post'
    notifications.create(content: activity, activator: member)
  end
end
