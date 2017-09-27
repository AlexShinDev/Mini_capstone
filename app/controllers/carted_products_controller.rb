class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.current_cart
  end

  def create
    
    carted_product = CartedProduct.new(
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quanitity: params[:quantity],
                                        status: "carted"
                                        )
    carted_product.save
    redirect_to "/carted_products"
  end
#don't need a "new" page because there's already a form on the products show page
  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update[status: "ordered"]
    flash[:success] = "Product Removed"
    redirect_to "/carted_product"
  end
end
