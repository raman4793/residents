class Notification < ApplicationRecord
  belongs_to :activator, polymorphic: true
  belongs_to :eventable, polymorphic: true
end
