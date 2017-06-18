class ChangeRestaurantAttributes < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :price_range, :string
    change_column :restaurants, :open_time, :float
    change_column :restaurants, :close_time, :float
    add_column :restaurants, :neighbourhood, :string
    add_column :restaurants, :summary, :text
  end
end
