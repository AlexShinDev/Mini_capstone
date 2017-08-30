class ProductsController < ApplicationController
  def all_products_action
    @product = Product.all
    render 'all_products_page.html.erb'
  end
end
