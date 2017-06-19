class FixUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :emails
      t.string :email
    end
  end
end
