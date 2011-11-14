module Marketplace
  class Client 
    attr_accessor :endpoint, :request_parameters, :seller

    def initialize(options)
      self.endpoint = options[:endpoint]
      self.seller = options[:seller]
    end

    def attributes
      { endpoint: endpoint }
    end

    def list_orders(options)
      request(Marketplace::ListOrder.create(options))
    end

    def request(parameters)
      Marketplace.request(:post, parameters.merge(attributes))
    end
  end
end
