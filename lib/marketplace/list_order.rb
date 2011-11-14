module Marketplace
  class ListOrder < Order
    attr_accessor :created_at

    def valid?
      created_at
    end
  end
end
