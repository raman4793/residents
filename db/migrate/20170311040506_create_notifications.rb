class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :content
      t.integer :activator_id
      t.string :activator_type
      t.integer :eventable_id
      t.string :eventable_type

      t.timestamps
    end
  end
end
