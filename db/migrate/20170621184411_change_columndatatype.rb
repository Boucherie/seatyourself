class ChangeColumndatatype < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :open_time, :time
    change_column :restaurants, :close_time, :time 
  end
end
