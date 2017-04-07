class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :sendable_id
      t.string :sendable_type
      t.integer :recipientable_id
      t.string :recipientable_type

      t.timestamps
    end
  end
end
