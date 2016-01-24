module EPOS
  describe Checkout do
    context '#initialize' do
      it 'has the PromotionalRules ready' do
        expect(subject.rules).to be_instance_of(PromotionalRules)
      end

      it 'has the Basket ready' do
        expect(subject.basket).to be_instance_of(Basket)
      end

      it 'begins with a total of zero' do
        expect(subject.total).to eq 0
      end
    end
  end
end
