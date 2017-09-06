class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new

  end

  def create
    @product = Product.new(
                            product_type: params[:product_type],
                            image: params[:image],
                            price: params[:price],
                            description: params[:description]
                            )
     @product.save
     flash[:success] = "Successfully created"
     redirect_to "/products/#{@product.id}"
  end


  def show
    @product = Product.find(params[:id])
    #Product.find()
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.assign_attributes(
                            product_type: params[:product_type],
                            image: params[:image],
                            price: params[:price],
                            description: params[:description]
                            )
  
    
    @product.save
    flash[:warning] = "Successfully updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product = Product.find(params[:id])

    product.destroy
    flash[:danger] = "Successfully deleted"
    redirect_to "/products"
  end
end
