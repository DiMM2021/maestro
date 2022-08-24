# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.where(category: params[:category]).all if params[:category]
  end

  def show
    @item = Item.find(params[:id])
  end
end
