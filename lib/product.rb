module EPOS
  class Product
    attr_reader :name, :code

    def initialize(options = {})
      @name = options.fetch(:name)
      @code = options.fetch(:code)
    end
  end
end
