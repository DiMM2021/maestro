# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :name, presence: true
  validates :mobile, presence: true, numericality: true
end
