module EPOS
  class Checkout
    attr_reader :rules, :basket
    attr_accessor :total_price

    def initialize(rules = PromotionalRules.new, basket = Basket.new)
      @rules       = rules
      @basket      = basket
      @total_price = 0
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
      @total_price = 0
      basket.content.each { |item| @total_price += item.price }
      @total_price > PromotionalRules::DISCOUNT_THRESHOLD ? apply_rules.round(2) : total_price.round(2)
    end

    private

    def apply_rules
      rules.spending_over_sixty(@total_price)
    end
  end
end
