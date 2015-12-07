class CreateGroups < ActiveRecord::Migration
  def change 
    create_table :groups do |t|
      t.references :creator, index: true

      t.string :name
      t.decimal :latitude,  precision: 15, scale: 10, index: true
      t.decimal :longitude, precision: 15, scale: 10, index: true
      t.boolean :active, default: true
      t.boolean :private, default: false
      t.string :password

      t.timestamps null: false
    end

    add_index :groups, [:latitude, :longitude]
    add_foreign_key :groups, :users, column: :creator_id
  end
end
