# frozen_string_literal: true

class LineItemsController < InheritedResources::Base
  def create
    item = Item.find(params[:item_id])
    current_cart = @current_cart

    if @current_cart.items.include?(item)
      @line_item = @current_cart.line_items.find_by(item_id: item)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item = @current_cart.line_items.build(item:)
      @line_item.item = item
    end
    @line_item.save
    flash[:notice] = 'Товар успешно добавлен.'
    redirect_to cart_path(current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity += 1
      @line_item.save
      redirect_to cart_path(@line_item.cart)
    end
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity -= 1 if @line_item.quantity > 1
    @line_item.save
    redirect_to cart_path(@line_item.cart)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@line_item.cart)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :item_id, :cart_id, :order_id)
  end
end
