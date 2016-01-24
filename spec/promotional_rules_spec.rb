module EPOS
  describe PromotionalRules do
    let(:total)          { PromotionalRules::DISCOUNT_THRESHOLD }
    let(:discount)       { 1 - PromotionalRules::DISCOUNT }
    let(:basket)         { Basket.new }
    let(:cheap_lavender) { PromotionalRules::LAVENDER_PROMOTION }
    let(:exp_lavender)   { PromotionalRules::LAVENDER_PRICE }

    context '#spending_over_sixty' do
      it 'applies a discount of 10% to totals over £60' do
        upper_total = total + 5
        discount_total = upper_total * discount
        expect(subject.spending_over_sixty(upper_total)).to eq discount_total
      end

      it 'does not apply a discount to totals of £60' do
        expect(subject.spending_over_sixty(total)).to be_nil
      end

      it 'does not apply a discount to totals less than £60' do
        total_under = rand 1..total
        expect(subject.spending_over_sixty(total_under)).to be_nil
      end
    end

    context '#lavender_hearts_promotion' do
      it 'lowers the price of lavender hearts to £8.50' do
        basket.add('001')
        basket.add('001')
        subject.lavender_hearts_promotion(basket)
        expect(basket.content.first.price).to eq cheap_lavender
      end

      it 'does not lower prices if less than two items' do
        basket.add('001')
        subject.lavender_hearts_promotion(basket)
        expect(basket.content.first.price).to eq exp_lavender
      end

      it 'updates prices according to number of items in basket' do
        basket.add('001')
        basket.add('001')
        basket.remove('001')
        expect(basket.content.first.price).to eq exp_lavender
      end
    end
  end
end
