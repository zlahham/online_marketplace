module EPOS
  describe PromotionalRules do
    let(:total)    { PromotionalRules::DISCOUNT_THRESHOLD }
    let(:discount) { 1 - PromotionalRules::DISCOUNT }
    let(:basket)   { Basket.new }

    context '#spending_over_sixty' do
      it 'applies a discount of 10% to totals over £60' do
        total_over = total + 5
        expect(subject.spending_over_sixty(total_over)).to eq total_over * discount
      end
      it 'does not apply a discount to totals of £60' do
        expect(subject.spending_over_sixty(total)).to be_nil
      end

      it 'does not apply a discount to totals less than £60' do
        total_under = rand 1..60
        expect(subject.spending_over_sixty(total_under)).to be_nil
      end
    end

    context '#lavender_hearts_promotion' do
      it 'lowers the price of lavender hearts to £8.50' do
        basket.add('001')
        basket.add('001')
        subject.lavender_hearts_promotion(basket, '001')
        expect(basket.content.first.price).to eq 8.50
      end
    end
  end
end
