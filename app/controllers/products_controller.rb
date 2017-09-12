class ProductsController < ApplicationController
  def index
    @products = Product.all

    sort_attribute = params[:sort]
    desc_attribute = params[:order_by]
    disc_attribute = params[:disc]
    random_attribute = params[:rand]

    if sort_attribute  && desc_attribute 
      @products = @products.order(sort_attribute => desc_attribute)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    end

    if disc_attribute
      @products = @products.where("price < ?", disc_attribute)
      # arr = []
      # @products.each do |product|
      #   arr << product if product.discounted?
      # end
      # @products = arr
    end
    
    if random_attribute
      arr = []

      @products.each do |product|
        arr << product[:id]
      end

      rand_num = arr.shuffle
      @products = @products.find(rand_num.first)
    end

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
