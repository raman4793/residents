class AssociationAdmin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :blood
  has_one :residence_association, dependent: :destroy

  has_many :conversations, as: :sendable, dependent: :destroy
  has_many :conversations, as: :recipientable, dependent: :destroy

  has_many :complaints, as: :sendable
  has_many :complaints, as: :recipient

  has_many :notifications, as: :activator

  has_many :messages, as: :sender

  validates :email, uniqueness: true

  def recieved_complaints
    Complaint.where(recipient_id: id, recipient_type: 'AssociationAdmin')
  end

  def sent_complaints
    Complaint.where(sendable_id: id, sendable_type: 'AssociationAdmin')
  end

  def send_message(to, msg)
    conversation = Conversation.where({sendable: self, recipientable: to}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: to, recipientable: self}).first
    end
    if conversation.nil?
      conversation = Conversation.create({sendable: self, recipientable: to})
    end
    conversation.messages.create(content: msg)
  end

  def get_messages(from)
    conversation = Conversation.where({sendable: self, recipientable: from}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: from, recipientable: self}).first
    end
    if conversation.nil?
      nil
    else
      conversation.messages
    end
  end

  def self.get_conversation(from, to)
    conversation = Conversation.where({sendable: from, recipientable: to}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: to, recipientable: from}).first
    end
  end

  def get_conversations()
    sent = Conversation.where({sendable: self})
    recieved = Conversation.where({recipientable: self})
    conversations = sent.or(recieved)
  end
end
