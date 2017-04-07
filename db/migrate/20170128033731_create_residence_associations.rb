class CreateResidenceAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :residence_associations do |t|
      t.string :name,                     null: false, default: ""
      t.string :subdomain,                null: false, default: ""
      t.string :description,              null: false, default: ""
      t.decimal :lat,                     null: false, default: 8.524139100000001
      t.decimal :lng,                     null: false, default: 76.93663760000004
      t.references :association_admin,    null: false, foreign_key: true
      t.boolean :approved,                 default: false
      t.string :logo

      t.timestamps
    end
  end
end
