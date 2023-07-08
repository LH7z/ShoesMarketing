class AddUserToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :users, foreign_key: true
  end
end