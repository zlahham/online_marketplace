module EPOS
  class PromotionalRules
    DISCOUNT = 0.1
    DISCOUNT_THRESHOLD = 60

    def spending_over_sixty(total)
      total * (1 - DISCOUNT) if over_sixty?(total)
    end

    private

    def over_sixty?(total)
      return true if total > 60
    end

    # If you buy 2 or more lavender hearts then the price drops to 8-50
  end
end
