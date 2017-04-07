class Blood < ApplicationRecord
  has_many :association_admins
  has_many :members

  validates :group, presence: true
  validates :group, uniqueness: true
end
