class RemoveCommentsToProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :comments, :string
  end
end
