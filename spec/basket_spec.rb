module EPOS
  describe Basket do
    context '#initialize' do
      it 'contains no products when' do
        expect(subject.content).to be_empty
      end
    end

    context '#add' do
      it 'updates the basket content with a product' do
        products = Basket::PRODUCTS
        subject.add(products.keys.first)
        expect(subject.content.first).to be_instance_of(Product)
      end

      it 'does not add to basket with invalid key' do
        expect { subject.add('004') }.to raise_error NoMethodError
      end
    end
  end
end
