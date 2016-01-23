module EPOS
  describe PromotionalRules do
    context '#spending_over_sixty' do
      let(:total)    { PromotionalRules::DISCOUNT_THRESHOLD }
      let(:discount) { 1 - PromotionalRules::DISCOUNT }

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
  end
end
