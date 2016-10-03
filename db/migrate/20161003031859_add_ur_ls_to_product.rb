class AddUrLsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img_url, :string
    add_column :products, :buy_url, :string
  end
end
