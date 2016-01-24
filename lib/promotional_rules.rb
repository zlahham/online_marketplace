module EPOS
  class PromotionalRules
    DISCOUNT = 0.1
    DISCOUNT_THRESHOLD = 60
    LAVENDER_PROMOTION = 8.50
    LAVENDER_THRESHOLD = 2

    def spending_over_sixty(basket_total)
      basket_total * (1 - DISCOUNT) if over_sixty?(basket_total)
    end

    def lavender_hearts_promotion(basket, code)
      apply_new_pricing(basket, code) if basket.number_of_items(code) >= LAVENDER_THRESHOLD
    end

    private

    def over_sixty?(total)
      return true if total > 60
    end

    def apply_new_pricing(basket, code)
      basket.content.map do |item|
        next unless item.code == code
        item.price = LAVENDER_PROMOTION
      end
    end
  end
end
