class Event < ApplicationRecord
  mount_uploader :poster, ImageUploader
  belongs_to :residence_association

  has_many :photos, as: :uploadable

  validates :title, presence: true
  validates :description, presence: true

  default_scope { order(created_at: :desc)}
end
