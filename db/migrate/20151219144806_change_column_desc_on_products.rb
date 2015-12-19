class ChangeColumnDescOnProducts < ActiveRecord::Migration
  def change
    change_column :products, :desc, :text
  end
end
