# CartItem Model Specs
# ====================

# Load necessary dependencies and configure test environment.
require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:product) { FactoryBot.create(:product) }

  # Test Case: '.initialize new cart'
  # It creates a new cart item with specified quantity and price.
  describe '.initialize new cart' do
    it 'creates a new cart item with specified quantity and price' do
      new_cart_item = CartItem.new(product, 2)
      expect(new_cart_item.product).to eq(product)
      expect(new_cart_item.quantity).to eq(2)
      expect(new_cart_item.price).to eq(Offer.offer_price(product, 2))
    end
  end

  # Test Case: '.push_product'
  # It adds a product to the cart or increments its quantity if it already exists.
  describe '.push_product' do
    # Context: When adding a new product
    context 'when adding a new product' do
      it 'adds the product to the cart' do
        cart = []
        updated_cart = CartItem.push_product(cart, product)
        expect(updated_cart.first.product).to eq(product)
        expect(updated_cart.first.quantity).to eq(1)
      end
    end

    # Context: When adding an existing product
    context 'when adding an existing product' do
      it 'increments the quantity of the product' do
        cart = []
        initial_cart = CartItem.push_product(cart, product).flatten
        updated_cart = CartItem.push_product(initial_cart, product).flatten
        expect(updated_cart.first.quantity).to eq(2)
      end
    end
  end

  # Test Case: '.product_found'
  # It updates quantity and price of the cart item.
  describe '.product_found' do
    it 'updates quantity and price of the cart item' do
      cart_item = CartItem.new(product, 1)
      updated_cart_item = CartItem.product_found(cart_item, product, 1)
      expect(updated_cart_item.quantity).to eq(2)
      # Assume Offer.offer_price returns a calculated price
      expect(updated_cart_item.price).to eq(Offer.offer_price(product, 2))
    end
  end

  # Additional Notes:
  # - Depending on how Offer.offer_price is implemented, you might need to stub it.
end
