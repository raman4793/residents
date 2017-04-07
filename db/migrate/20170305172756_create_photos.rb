class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :uploadable_id
      t.string :uploadable_type

      t.timestamps
    end
  end
end
