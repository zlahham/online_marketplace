module EPOS
  describe Product do
    context '#initialize' do
      let(:product) { Product.new(code: '001', name: 'Cat Food', price: 1.99) }

      it 'shows the product code' do
        expect(product.code).to eq '001'
      end

      it 'shows the product name' do
        expect(product.name).to eq 'Cat Food'
      end

      it 'shows the product price' do
        expect(product.price).to eq 1.99
      end
    end
  end
end
