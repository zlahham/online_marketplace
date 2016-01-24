module EPOS
  class PromotionalRules
    CODE               = Basket::PRODUCTS.keys.first
    LAVENDER_PRICE     = Basket::PRODUCTS[CODE][:price]
    LAVENDER_PROMOTION = 8.50
    LAVENDER_THRESHOLD = 2
    DISCOUNT_THRESHOLD = 60
    DISCOUNT           = 0.1

    def spending_over_sixty(basket_total)
      basket_total * (1 - DISCOUNT) if over_sixty?(basket_total)
    end

    def lavender_hearts_promotion(basket)
      items_more_than_limit?(basket) ? apply_new_pricing(basket, CODE) : apply_old_pricing(basket, CODE)
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

    def items_more_than_limit?(basket)
      basket.number_of_items(CODE) >= LAVENDER_THRESHOLD ? true : false
    end
  end
end
