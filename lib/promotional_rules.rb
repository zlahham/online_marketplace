module EPOS
  class PromotionalRules
    DISCOUNT = 0.1
    DISCOUNT_THRESHOLD = 60

    def spending_over_sixty(basket_total)
      basket_total * (1 - DISCOUNT) if over_sixty?(basket_total)
    end

    def lavender_hearts_promotion(basket, code)
      if basket.number_of_items(code) >= 2
        basket.content.map do |item|
          next unless item.code == code
          item.price = 8.50
        end
      end
    end

    private

    def over_sixty?(total)
      return true if total > 60
    end
  end
end
