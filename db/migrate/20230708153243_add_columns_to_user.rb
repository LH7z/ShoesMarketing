class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_reference :users, :products, foreign_key: true
  end
end
