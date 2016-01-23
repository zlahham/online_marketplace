require 'yaml'

module EPOS
  class Basket
    attr_accessor :content

    PRODUCTS = YAML.load_file('product_list.yml')

    def initialize
      @content = []
    end

    def add(id)
      content << Product.new(
        code: id,
        name: PRODUCTS[id][:name],
        price: PRODUCTS[id][:price]
      )
    end
  end
end
