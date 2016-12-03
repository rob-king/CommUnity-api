class AddImageUrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :imageURL, :string
  end
end
