# Cart class manages a shopping cart using Rails cache for storage.
class Cart
  # Placeholder method for future implementation of cart price calculation.
  def caliculate_cart_price; end

  # Adds a product to the cart stored in Rails cache.
  # @param product [Product] Product to be added.
  def self.add_cart(product, quantity = 1)
    cart = Rails.cache.read('cart') || [] # Retrieve or initialize the cart
    cart = CartItem.push_product(cart, product, quantity) # Add product to cart
    Rails.cache.write('cart', cart.flatten)       # Update cart in cache
  end

  # Retrieves the list of items in the cart.
  # @return [Array] Cart items.
  def self.items
    Rails.cache.read('cart') || [] # Return cart items or an empty array if cart is empty
  end

  # Empties all items from the cart.
  def self.empty_cart
    Rails.cache.write('cart', []) # Reset cart to empty
  end

  # Calculates the total price of items in the cart.
  # @return [Numeric] Total price of cart items.
  def self.total
    # TODO: Add logic for offers or discounts.
    items.map(&:price).inject(:+) # Sum up prices of all items
  end
end
