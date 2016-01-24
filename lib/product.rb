module EPOS
  class Product
    attr_reader :code, :name
    attr_accessor :price

    def initialize(options = {})
      @code = options.fetch(:code) # if options[:code].is_a? Fixnum
      @name = options.fetch(:name)
      @price = options.fetch(:price)
    end
  end
end
