module EPOS
  class Checkout
    attr_reader :rules, :basket
    attr_accessor :total_price

    def initialize(rules = PromotionalRules.new, basket = Basket.new)
      @rules       = rules
      @basket      = basket
      @total_price = Basket::ZERO
    end

    def scan(item_code)
      basket.add(item_code)
      rules.lavender_hearts_promotion(basket)
    end

    def un_scan(item_code)
      basket.remove(item_code)
      rules.lavender_hearts_promotion(basket)
    end

    def total
      @total_price = Basket::ZERO
      basket.content.each { |item| @total_price += item.price }
      apply_rules_to_price
    end

    private

    def apply_rules_to_price
      final_price = rules.spending_over_sixty(@total_price)
      price_greater_than_promotions ? final_price.round(2) : total_price.round(2)
    end

    def price_greater_than_promotions
      @total_price > PromotionalRules::DISCOUNT_THRESHOLD
    end
  end
end
