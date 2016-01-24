module EPOS
  describe Checkout do
    context ',#initialize' do
      it 'has the PromotionalRules ready' do
        expect(subject.rules).to be_instance_of(PromotionalRules)
      end

      it 'has the Basket ready' do
        expect(subject.basket).to be_instance_of(Basket)
      end

      it 'begins with a total of zero' do
        expect(subject.total_price).to eq 0
      end
    end

    context '#scan' do
      it 'allows us to add the item to the checkout basket' do
        subject.scan('001')
        expect(subject.basket.content.first.code).to eq '001'
      end
    end

    context '#total' do
      xit 'returns the total cost with regards to promotional_rules' do
        subject.scan('001')
        subject.scan('001')
        subject.scan('001')
        expect(subject.total).to eq 25.5
      end
    end
  end
end
