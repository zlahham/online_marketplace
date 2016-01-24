module EPOS
  class Checkout
    attr_reader :rules, :basket, :total

    def initialize(rules = PromotionalRules.new, basket = Basket.new)
      @rules = rules
      @basket = basket
      @total = 0
    end
  end
end
