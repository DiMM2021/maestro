# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :line_items, dependent: :destroy
end
