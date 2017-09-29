class UsersController < ApplicationController

  validates :email, uniqueness: true
  def new
    
  end

  def create
    user = User.new(
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )

    if user.save
      session[:user_id] = user.id 
      flash[:success] = " Succesfully Created Account!"
      redirect_to '/'
    else
      flash[:warning] = "Invalid Email or Password!"
      redirect_to '/signup'
    end
  end
end
