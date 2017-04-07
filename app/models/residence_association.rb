class ResidenceAssociation < ApplicationRecord
  mount_uploader :logo, ImageUploader

  validates :subdomain, presence: true
  validates :subdomain, uniqueness: true

  validates :name, presence: true

  validates :lat, presence: true
  validates :lng, presence: true

  has_many :notifications, as: :eventable

  belongs_to :association_admin
  has_many :houses
  has_many :events
  has_many :members, through: :houses
  has_many :blogs, through: :members

  def type
    'Association'
  end

  def self.unapproved
    where(approved: false).order(created_at: :desc)
  end

  after_update do
    if approved
      activity = 'New Association joined'
      notifications.create(content: activity, activator: Admin.first)
    end
  end

  def get_notifications
    mids = members.pluck(:id)
    activities = Notification.where(eventable_type: 'ResidenceAssociation', eventable_id: id).or(Notification.where(activator_type: 'Member', activator_id: mids)).or(Notification.where(activator_type: 'AssociationAdmin', activator_id: association_admin.id)).or(Notification.where(eventable_type: 'House', eventable_id: houses.pluck(:id)))
    activities.order(created_at: :desc)
  end
end
