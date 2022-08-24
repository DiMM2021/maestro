# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item
  belongs_to :cart, optional: true

  def total_price
    quantity * item.price
  end
end
