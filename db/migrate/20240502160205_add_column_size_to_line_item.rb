class AddColumnSizeToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :size, :string
  end
end
