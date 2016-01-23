module EPOS
  class PromotionalRules
    DISCOUNT = 0.1
    DISCOUNT_THRESHOLD = 60

    def spending_over_sixty(basket_total)
      basket_total * (1 - DISCOUNT) if over_sixty?(basket_total)
    end

    def lavender_hearts_promotion(basket_total)
      8.5
      # if two_or_more?(basket_total)
      # end
    end

    private

    def over_sixty?(total)
      return true if total > 60
    end

    def two_or_more?(total)
      return true if total >= 2
    end

    # If you buy 2 or more lavender hearts then the price drops to 8-50
  end
end
