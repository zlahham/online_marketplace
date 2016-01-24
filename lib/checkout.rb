module EPOS
  class Checkout
    attr_reader   :rules, :basket
    attr_accessor :total_price

    def initialize(rules = PromotionalRules.new, basket = Basket.new)
      @rules       = rules
      @basket      = basket
      @total_price = 0
    end

    def scan(item_code)
      basket.add(item_code)
      @total_price += basket.content.last.price
    end

    def total
      # rules.spending_over_sixty(total)
      # rules.lavender_hearts_promotion(basket, item_code)
    end
  end
end
