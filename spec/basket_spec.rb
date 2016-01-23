module EPOS
  describe Basket do
    context '#initialize' do
      it 'contains no products when empty' do
        expect(subject.content).to be_empty
      end

      it 'contains products if not empty' do
        subject.content = ['Cat Food']
        expect(subject.content).to eq ['Cat Food']
      end
    end

    context '#add' do
      it 'updates the basket content with a product' do
        products = Basket::PRODUCTS
        subject.add(products.keys.first)
        expect(subject.content.first).to be_instance_of(Product)
      end
    end
  end
end
