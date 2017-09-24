class CartedProduct < ApplicationRecord
  belongs_to :user_id
  belongs_to :product_id
  belongs_to :order_id, optional: true
end
