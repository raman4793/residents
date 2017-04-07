class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event, polymorphic: true
  validates :event, presence: false

  def uploaded
    upload = uploadable_type.constantize
    upload.find(uploadable_id)
  end
end
