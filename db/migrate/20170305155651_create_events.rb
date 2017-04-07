class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :poster
      t.references :residence_association, foreign_key: true

      t.timestamps
    end
  end
end
