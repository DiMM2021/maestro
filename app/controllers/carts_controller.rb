# frozen_string_literal: true

class CartsController < InheritedResources::Base
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    flash[:alert] = 'Ваша корзина очищена.'
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def cart_params
    params.require(:cart).permit
  end
end
