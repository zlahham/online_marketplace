module EPOS
  describe Basket do
    let(:products)       { Basket::PRODUCTS }
    let(:product_code_1) { products.keys.first }
    let(:product_code_3) { products.keys.last }

    context '#initialize' do
      it 'contains no products when' do
        expect(subject.content).to be_empty
      end
    end

    context '#add' do
      it 'updates the basket content with a product' do
        subject.add(product_code_1)
        expect(subject.content.first).to be_instance_of(Product)
      end

      it 'does not add to basket with invalid key' do
        expect { subject.add('004') }.to raise_error NoMethodError
      end
    end

    context '#remove' do
      it 'removes item from content' do
        subject.add(product_code_1)
        subject.remove(product_code_1)
        expect(subject.content).to be_empty
      end

      it 'only removes only one item' do
        subject.add(product_code_1)
        subject.add(product_code_1)
        subject.remove(product_code_1)
        expect(subject.total_items).to eq 1
      end

      it 'does not work on empty basket' do
        expect { subject.remove(product_code_1) }.to raise_error 'Basket is empty'
      end
    end

    context '#total_items' do
      it 'returns the number of items in a basket' do
        subject.add(product_code_1)
        expect(subject.total_items).to eq 1
      end
    end

    context '#number_of_items' do
      it 'return the number of items of a specif product' do
        subject.add(product_code_1)
        subject.add(product_code_3)
        expect(subject.number_of_items(product_code_1)).to eq 1
      end
    end
  end
end
