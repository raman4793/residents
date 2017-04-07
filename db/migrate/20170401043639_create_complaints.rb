class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.text :content
      t.integer :sendable_id
      t.string :sendable_type
      t.integer :recipient_id
      t.string :recipient_type

      t.timestamps
    end
  end
end
