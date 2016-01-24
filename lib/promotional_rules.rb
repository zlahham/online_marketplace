module EPOS
  class PromotionalRules
    DISCOUNT = 0.1
    DISCOUNT_THRESHOLD = 60
    LAVENDER_CODE      = Basket::PRODUCTS.keys.first
    LAVENDER_PRICE     = Basket::PRODUCTS[LAVENDER_CODE][:price]
    LAVENDER_PROMOTION = 8.50
    LAVENDER_THRESHOLD = 2

    def spending_over_sixty(basket_total)
      basket_total * (1 - DISCOUNT) if over_sixty?(basket_total)
    end

    def lavender_hearts_promotion(basket)
      if basket.number_of_items(LAVENDER_CODE) >= LAVENDER_THRESHOLD
        apply_new_pricing(basket, LAVENDER_CODE)
      else
        # TEST THIS
        apply_old_pricing(basket, LAVENDER_CODE)
      end
    end

    private

    def over_sixty?(total)
      return true if total > DISCOUNT_THRESHOLD
    end

    def apply_new_pricing(basket, code)
      basket.content.map do |item|
        next unless item.code == code
        item.price = LAVENDER_PROMOTION
      end
    end

    def apply_old_pricing(basket, code)
      basket.content.map do |item|
        next unless item.code == code
        item.price = LAVENDER_PRICE
      end
    end
  end
end
