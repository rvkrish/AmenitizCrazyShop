class CartItem
  attr_accessor :product, :quantity, :price

  def initialize(product,quantity)
    self.product= product
    self.quantity = quantity
    self.price = Offer.offer_price(product, quantity)
  end

  def self.push_product(cart, product, quantity = 1)
    product_added = false
    cart.map do |cart_item|
      if cart_item.product.id == product.id
        product_added = true
        product_found(cart_item, product, quantity) # Assuming this method modifies cart_item
      else
        cart_item
      end
    end
    product_added ? cart : cart << CartItem.new(product, quantity)
  end

  def self.product_found(cart_item, product, quantity = 1)
    cart_item.quantity += quantity
    cart_item.price = Offer.offer_price(product, cart_item.quantity)
    cart_item
  end

end
