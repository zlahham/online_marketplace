module EPOS
  class Product
    attr_reader :code, :name
    attr_accessor :price

    def initialize(options = {})
      @code = options.fetch(:code)
      @name = options.fetch(:name)
      @price = options.fetch(:price)
    end
  end
end
