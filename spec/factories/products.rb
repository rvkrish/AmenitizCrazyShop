FactoryBot.define do
  factory :product do
    id {1}
    product_code { 'GR1' }
    name { 'Green Tea' }
    price { 3.11 }
    association :offer
  end

  factory :product_two, class: 'Product' do
    id {2}
    product_code { 'SR1' }
    name { 'Strawberries' }
    price { 5.00 }
    association :offer, factory: :offer_two
  end

  factory :product_three, class: 'Product' do
    id {3}
    product_code { 'CF1' }
    name { 'Coffee' }
    price { 11.23 }
    association :offer, factory: :offer_three
  end

end
