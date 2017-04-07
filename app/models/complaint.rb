class Complaint < ApplicationRecord
  belongs_to :association_admin, polymorphic: true
  belongs_to :member, polymorphic: true


  def sender
    send = sendable_type.constantize
    send.find(sendable_id)
  end

  def recipient
    send = recipient_type.constantize
    send.find(recipient_id)
  end

end
