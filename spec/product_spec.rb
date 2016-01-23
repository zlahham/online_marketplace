module EPOS
  describe Product do
    context '#initialize' do
      let(:product) { Product.new(name: 'Cat Food') }

      it 'shows the product name' do
        expect(product.name).to eq 'Cat Food'
      end
    end
  end
end
