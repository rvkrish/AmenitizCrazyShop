class Offer < ApplicationRecord
  has_many :products
  class << self
    def offer_price(product, quantity)
      case product.offer.code
      when 'BOGO'
        apply_bogo_offer(product, quantity)
      when 'B3PLUSP5'
        apply_bulk_discount_point_five(product, quantity)
      when 'B3PLUSPAY2'
        apply_bulk_discount_two_by_three(product,quantity)
      else
        product.price * quantity
      end
    end


    # Apply Buy One, Get One Free offer for green tea.
    def apply_bogo_offer(product, quantity)
      (quantity / 2 + quantity % 2) * product.price
    end


    # Apply bulk discount for strawberries.
    def apply_bulk_discount_point_five(product,quantity)
      if quantity >= 3
        quantity * (product.price - 0.5) # price drops to 4.50€
      else
        quantity * product.price
      end
    end


    # Apply bulk discount for coffee.
    def apply_bulk_discount_two_by_three(product,quantity)
      if quantity >= 3
        quantity * (product.price * 2 / 3) # price drops to 2/3 of the original
      else
        quantity * product.price
      end
    end
  end
end
