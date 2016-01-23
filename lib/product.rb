module EPOS
  class Product
    attr_reader :name

    def initialize(options = {})
      @name = options.fetch(:name)
    end
  end
end
