# This RSpec test file covers the Cart model's functionality.
# It includes tests for adding products to the cart, emptying the cart,
# and calculating the total price of items in the cart.

# Load necessary dependencies and configure test environment.
require 'rails_helper'
require 'mock_redis'

RSpec.describe Cart, type: :model do
  # Define test context variables:
  let(:redis_instance) { MockRedis.new }        # Mock Redis instance for testing.
  let(:product) { FactoryBot.build(:product) }  # Factory-created product instance for testing.
  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }  # Memory store used as a cache for testing.
  let(:cache) { Rails.cache }  # Rails.cache using the memory store.

  # Set up the environment for each test:
  before do
    allow(Rails).to receive(:cache).and_return(memory_store)  # Configure Rails.cache to use the memory store.
    Rails.cache.clear  # Clear the cache to ensure a clean slate before each test.
  end

  # Test Case: '.add_cart'
  # It verifies that a product is added to the cart.
  describe '.add_cart' do
    it 'adds a product to the cart' do
      Cart.add_cart(product)
      expect(Cart.items.collect { |e| e.product.id }).to include(product.id)
    end
  end

  # Test Case: '.empty_cart'
  # It verifies that the cart is emptied.
  describe '.empty_cart' do
    it 'empties the cart' do
      Cart.add_cart(product)
      Cart.empty_cart
      expect(Cart.items).to be_empty
    end
  end

  # Test Case: '.total'
  # It calculates the total price of items in the cart.
  describe '.total' do
    let(:green_tea) { FactoryBot.build(:product) }  # Factory-created product instance for testing.
    let(:strawberries) { FactoryBot.build(:product_two) }  # Factory-created product instance for testing.
    let(:coffee) { FactoryBot.build(:product_three) }  # Factory-created product instance for testing.

    # It calculates the total price of items in the cart.
    # Tests various scenarios including different product quantities and offers.
    it 'calculates the total price of items in the cart' do
      Cart.add_cart(green_tea)
      Cart.add_cart(coffee)
      expected_total = green_tea.price + coffee.price
      expect(Cart.total).to eq(expected_total)
    end

    # It calculates the total price of items in the cart when the cart has Item with one offer.
    it 'calculates the total price of items in the cart when cart has Item with one offer' do
      Cart.add_cart(green_tea, 2)
      expected_total = green_tea.price
      expect(Cart.total).to eq(expected_total)
    end

    # It calculates the total price of items in the cart when the cart has multiple Offers.
    it 'calculates the total price of items in the cart when cart has multiple Offers' do
      Cart.add_cart(green_tea, 2)
      Cart.add_cart(strawberries, 3)
      Cart.add_cart(coffee, 3)
      expected_total = green_tea.price + Offer.offer_price(strawberries, 3) + Offer.offer_price(coffee, 3)
      expect(Cart.total).to eq(expected_total)
    end
  end
end
