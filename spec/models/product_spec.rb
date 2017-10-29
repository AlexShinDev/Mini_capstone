require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#discounted?' do
    it 'should return true if the price is under 50' do
      product = Product.create(price: 51, description: "h")
      expect(product.discounted?).to eq(false)
    end

    it 'should return true if the price is under 50' do
      product = Product.create(price: 2, description: "hello")
      expect(product.discounted?).to eq(true)
    end
  end
end
