class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    product = Product.find(params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * .99
    total = subtotal + tax



    @order = Order.new(
                      product_id: params[:product_id]
                      user_id: current_user.id,
                      quantity: params[:quantity]
                      subtotal:
                      tax:
                      total:
                      )
    @order.save

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end
end
