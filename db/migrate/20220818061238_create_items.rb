# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.string :size
      t.text :description
      t.integer :price, default: 0
      t.string :availability
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
