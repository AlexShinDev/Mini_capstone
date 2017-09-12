class Product < ApplicationRecord
  def friendly_update_at
    updated_at.strftime("%B %e, %Y ")
  end

  def discounted?
    price < 50
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
