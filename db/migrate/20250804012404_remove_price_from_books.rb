class RemovePriceFromBooks < ActiveRecord::Migration[8.0]
  def change
    remove_column :books, :price, :integer
  end
end
