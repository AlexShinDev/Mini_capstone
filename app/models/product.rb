class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products

  has_many :carted_products

  # has_many :orders
  # # def supplier
  # #   Supplier.find_by(id: self.supplier_id)
  # # end
  belongs_to :supplier

  has_many :image

  def friendly_update_at
    updated_at.strftime("%B %e, %Y ")
  end

  def discounted?
    price < 50
  end

  def tax
    price * 0.09
  end

  def first_image
    @products = Image.where(product_id: 2).first
  end

  def total
    price + tax
  end

  def default_image
    if images.empty?
      images.first.url
    else
      "https://st.depositphotos.com/1875497/3308/i/950/depositphotos_33080083-stock-photo-empty-sign-on-the-old.jpg"
    end
  end

  def category
    
  end
end
