class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :area_id
      t.integer :mobile
      t.string  :address
      t.timestamps null: false
    end
  end
end
