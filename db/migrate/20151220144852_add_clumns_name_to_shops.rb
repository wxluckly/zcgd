class AddClumnsNameToShops < ActiveRecord::Migration
  def change
    add_column :shops, :name, :string
  end
end
