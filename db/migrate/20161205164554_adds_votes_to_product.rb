class AddsVotesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :votes, :integer
  end
end
