require 'yaml'

module EPOS
  class Basket
    attr_accessor :content

    PRODUCTS = YAML.load_file('product_list.yml')
    ONE      = 1
    ZERO     = 0

    def initialize
      @content = []
    end
    
    def add(code)
      content << Product.new(
        code: code,
        name: PRODUCTS[code][:name],
        price: PRODUCTS[code][:price])
    end

    def remove(code)
      fail 'Basket is empty' if total_items == ZERO
      content.each_with_index do |item, i|
        next unless item.code == code
        content.delete_at(i)
        break
      end
    end

    def total_items
      content.count
    end

    def number_of_items(code)
      count = ZERO
      content.each do |item|
        next unless item.code == code
        count += ONE
      end
      count
    end
  end
end
