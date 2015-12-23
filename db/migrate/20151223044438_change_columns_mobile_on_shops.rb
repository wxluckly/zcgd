class ChangeColumnsMobileOnShops < ActiveRecord::Migration
  def change
    change_column :shops, :mobile, :string
  end
end
