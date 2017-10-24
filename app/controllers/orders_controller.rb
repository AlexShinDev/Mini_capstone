class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    carted_products = current_user.current_cart

    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    tax = subtotal * 0.09
    total = subtotal + tax


    order = Order.new(
                      user_id: current_user.id,
                      subtotal: subtotal,
                      tax: tax,
                      total: total
                      )

    carted_product.each do |carted_product|
      carted_product.update(status: "ordered", order_id:order.id)
    end

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end
end
