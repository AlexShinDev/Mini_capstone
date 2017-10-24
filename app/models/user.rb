class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products

  def current_cart
    carted_products.where(status: "carted")
  end
#   validates :email, inclusion: { in: %@% %.com %.edu %.co}
 end
