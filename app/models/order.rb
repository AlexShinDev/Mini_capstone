class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def current_cart
    @carted_products = current_user.carted_products.where("status = ?", "carted")
  end
end
