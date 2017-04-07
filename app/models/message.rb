class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :member, polymorphic: true
  belongs_to :association_admin, polymorphic: true

  def sender
    send = sender_type.constantize
    send.find(sender_id)
  end
end
