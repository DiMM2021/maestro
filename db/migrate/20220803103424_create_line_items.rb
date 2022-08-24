# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.integer :item_id
      t.integer :cart_id
      t.integer :order_id

      t.timestamps
    end
  end
end
