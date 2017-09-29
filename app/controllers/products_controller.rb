class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  def index
    @products = Product.all

    sort_attribute = params[:sort]
    desc_attribute = params[:order_by]
    disc_attribute = params[:disc]
    random_attribute = params[:rand]
    category_attribute = params[:category]

    if sort_attribute  && desc_attribute 
      @products = @products.order(sort_attribute => desc_attribute)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    end

    if disc_attribute
      @products = @products.where("price < ?", disc_attribute)
    end

    if category_attribute
      @products = Category.find_by(name: category_attribute).products
    end

  end

  def new
    redirect_to '/' unless current_user && current_user.admin
    @product = Product.new

  end

  def create
    
    @product = Product.new(
                            product_type: params[:product_type],
                            price: params[:price],
                            description: params[:description]
                            )
     if @product.save
      flash[:success] = "Successfully created"
      redirect_to "/products/#{@product.id}"
     else
      @suppliers = Supplier.all
      @errors = @product.errors.full_messages
      render "new.html.web"
     end
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
                            price: params[:price],
                            description: params[:description]
                            )
  
    
    if @product.save
      flash[:warning] = "Successfully updated"
      redirect_to "/products/#{@product.id}"
    else
      @errors = @product.errors.full_messages
      render "edit.html.web"
    end
  end

  def destroy
    
    product = Product.find(params[:id])

    product.destroy
    flash[:danger] = "Successfully deleted"
    redirect_to "/products"
  end
end