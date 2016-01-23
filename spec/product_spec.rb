module EPOS
  describe Product do
    context '#initialize' do
      let(:product) { Product.new(name: 'Cat Food', code: '001') }

      it 'shows the product name' do
        expect(product.name).to eq 'Cat Food'
      end

      it 'shows the product code' do
        expect(product.code).to eq '001'
      end
    end
  end
end
