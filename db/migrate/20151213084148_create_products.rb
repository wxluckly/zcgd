class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string  :title
      t.string  :material
      t.string  :standard
      t.string  :circulation
      t.string  :desc
      t.string  :image
      t.timestamps null: false
    end
  end
end
