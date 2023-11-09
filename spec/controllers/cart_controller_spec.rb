# spec/controllers/cart_controller_spec.rb
require 'rails_helper'

RSpec.describe CartController, type: :controller do
  let(:product) { FactoryBot.create(:product) }

  describe 'GET #index' do
    it 'returns a JSON response with cart items and total' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to include('items', 'total')
    end
  end

  describe 'POST #add_item' do
    it 'adds a product to the cart and returns JSON response' do
      post :add_item, params: { product_id: product.id }, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to include('items', 'total')
    end
  end

  describe 'POST #empty_cart' do
    it 'empties the cart and returns JSON response' do
      post :empty_cart, format: :json
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to include('items', 'total')
    end
  end
end
