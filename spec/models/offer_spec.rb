require 'rails_helper'

# Tests for the Offer model
RSpec.describe Offer, type: :model do

  # Testing the .offer_price method of Offer model
  describe '.offer_price' do

    # Context: Applying BOGO offer
    context 'when applying the BOGO offer to Green Tea' do
      let(:green_tea) { FactoryBot.build(:product) }

      # Tests BOGO offer for an even quantity of items
      it 'applies the BOGO offer correctly for an even quantity' do
        expect(Offer.offer_price(green_tea, 4)).to eq(6.22) # 2 * 3.11
      end

      # Tests BOGO offer for an odd quantity items
      it 'applies the BOGO offer correctly for an odd quantity' do
        expect(Offer.offer_price(green_tea, 3)).to eq(6.22) # (1 + 1/2) * 3.11
      end

      # Tests that BOGO offer is not applied for a single item
      it 'applies NO BOGO offer if quantity is one' do
        expect(Offer.offer_price(green_tea, 1)).to eq(3.11)
      end
    end

    # Context: Applying B3PLUSP5 (Buy 3 and get 0.5 euros offer on each item)
    context 'when applying the bulk discount to Strawberries' do
      let(:strawberries) { FactoryBot.build(:product_two) }

      # Tests no discount applied for less than 3 items
      it 'does not apply the discount for less than 3 quantities' do
        expect(Offer.offer_price(strawberries, 2)).to eq(10.00) # 2 * 5.00
      end

      # Tests discount applied for 3 or more items
      it 'applies the discount for 3 items' do
        expect(Offer.offer_price(strawberries, 3)).to eq(13.50) # 3 * 4.50
      end

      it 'applies the discount for 3 or more quantities' do
        expect(Offer.offer_price(strawberries, 4)).to eq(18.00) # 4 * 4.50
      end

    end

    # Context: Applying B3PLUSPAY2  (Buy 3 or more and pay 2 offer)
    context 'when applying the bulk discount to Coffee' do
      let(:coffee) { FactoryBot.build(:product_three) }

      # Tests no discount applied for less than 3 Coffee
      it 'does not apply the discount for less than 3 quantities' do
        expect(Offer.offer_price(coffee, 2)).to eq(22.46) # 2 * 11.23
      end

      # Tests discount applied for 3 items
      it 'applies the discount for 3 items' do
        expect(Offer.offer_price(coffee, 3)).to eq(22.46) # 3 * (11.23 * 2 / 3)
      end

       # Tests discount applied for more than 3 items
      it 'applies the discount for 3 or more quantities' do
        expect(Offer.offer_price(coffee, 6)).to eq(44.92) # 6 * (11.23 * 2 / 3)
      end

    end
  end

  describe '.apply_bogo_offer' do

    # Context: Applying BOGO offer to Green Tea
    context 'when applying the BOGO offer to Green Tea' do
      let(:green_tea) { FactoryBot.build(:product) }

      # Tests BOGO offer for an even quantity of Green Tea
      it 'applies the BOGO offer correctly for an even quantity' do
        expect(Offer.apply_bogo_offer(green_tea, 4)).to eq(6.22) # 2 * 3.11
      end

      # Tests BOGO offer for an odd quantity of Green Tea
      it 'applies the BOGO offer correctly for an odd quantity' do
        expect(Offer.apply_bogo_offer(green_tea, 3)).to eq(6.22) # (1 + 1/2) * 3.11
      end

      # Tests that BOGO offer is not applied for a single item
      it 'applies NO BOGO offer if quantity is one' do
        expect(Offer.apply_bogo_offer(green_tea, 1)).to eq(3.11)
      end
    end
  end


  describe '.apply_bulk_discount_point_five' do

    context 'when applying the bulk discount to Strawberries' do
      let(:strawberries) { FactoryBot.build(:product_two) }

      # Tests no discount applied for less than 3 items
      it 'does not apply the discount for less than 3 quantities' do
        expect(Offer.apply_bulk_discount_point_five(strawberries, 2)).to eq(10.00) # 2 * 5.00
      end

      # Tests discount applied for 3 or more items
      it 'applies the discount for 3' do
        expect(Offer.apply_bulk_discount_point_five(strawberries, 3)).to eq(13.50) # 3 * 4.50
      end

      it 'applies the discount for 3 or more quantities' do
        expect(Offer.apply_bulk_discount_point_five(strawberries, 4)).to eq(18.00) # 4 * 4.50
      end

    end
  end

  describe '.apply_bulk_discount_two_by_three' do

    # Context: Applying B3PLUSPAY2  (Buy 3 or more and pay 2 offer)
    context 'when applying the bulk discount to Coffee' do
      let(:coffee) { FactoryBot.build(:product_three) }

      # Tests no discount applied for less than 3 items
      it 'does not apply the discount for less than 3 quantities' do
        expect(Offer.offer_price(coffee, 2)).to eq(22.46) # 2 * 11.23
      end

      # Tests discount applied for 3 or more items
      it 'applies the discount for 3 items' do
        expect(Offer.offer_price(coffee, 3)).to eq(22.46) # 3 * (11.23 * 2 / 3)
      end

      # Tests discount applied for more than 3 items
      it 'applies the discount for 3 or more quantities' do
        expect(Offer.offer_price(coffee, 6)).to eq(44.92) # 6 * (11.23 * 2 / 3)
      end
    end

  end

end
