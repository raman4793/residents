class House < ApplicationRecord
  belongs_to :residence_association
  has_many :members, dependent: :destroy

  validates :no, presence: true
  validates :no, uniqueness: true

  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  has_many :notifications, as: :eventable

  after_create do
    activity  = 'added a new house to the association'
    notifications.create(content: activity, activator: admin)
  end

  def admin
    residence_association.association_admin
  end
end
