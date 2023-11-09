FactoryBot.define do
  factory :offer do
    code { "BOGO" }
    name { "Buy One Get One" }
    description { "The CEO is a big fan of buy-one-get-one-free offers and green tea. He wants us to add a rule to do this." }
  end

  factory :offer_two, class: Offer do
    code { "B3PLUSP5" }
    name { "Buy 3 or more get 0.5 Discount" }
    description { "The COO, though, likes low prices and wants people buying strawberries to get a price discount for bulk purchases. If you buy 3 or more strawberries, the price should drop to 4.50€." }
  end

  factory :offer_three, class: Offer do
    code { "B3PLUSPAY2" }
    name { "Buy 3 or more get 2/3 Discount" }
    description { "The VP of Engineering is a coffee addict. If you buy 3 or more coffees, the price of all coffees should drop to 2/3 of the original price." }
  end

end
