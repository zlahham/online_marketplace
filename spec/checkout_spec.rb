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
      it 'returns the total cost with regards to lavender' do
        subject.scan('001')
        subject.scan('001')
        subject.scan('001')
        expect(subject.total).to eq 25.5
      end

      it 'returns the total cost with regards to over 60' do
        subject.scan('001')
        subject.scan('002')
        subject.scan('003')
        expect(subject.total).to eq 66.78
      end

      it 'returns the total cost with regards to promotional_rules' do
        subject.scan('001')
        subject.scan('003')
        subject.scan('001')
        expect(subject.total).to eq 36.95
      end

      it 'returns the total cost with regards to promotional_rules' do
        subject.scan('001')
        subject.scan('002')
        subject.scan('001')
        subject.scan('003')
        expect(subject.total).to eq 73.76
      end
    end
  end
end
