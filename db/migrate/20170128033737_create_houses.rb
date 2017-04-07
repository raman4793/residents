class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :no,                      null: false, default: ""
      t.string :name,                    null: false, default: ""
      t.decimal :lat,                    null: false, default: 8.524139100000001
      t.decimal :lng,                    null: false, default: 76.93663760000004
      t.references :residence_association, foreign_key: true

      t.timestamps
    end
  end
end
