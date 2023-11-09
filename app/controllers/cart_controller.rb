class CartController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render json: {
          items: Cart.items,
          total: Cart.total
        }
      end
    end
  end


  def add_item
    Cart.add_cart(Product.find(params[:product_id]))
    respond_to do |format|
      format.json do
        render json: {
          items: Cart.items,
          total: Cart.total
        }
      end
    end
  end

  def empty_cart
    Cart.empty_cart
    respond_to do |format|
      format.json do
        render json: {
          items: Cart.items,
          total: Cart.total
        }
      end
    end
  end
end
