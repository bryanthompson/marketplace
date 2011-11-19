module Marketplace
  class Client 
    attr_accessor :request_parameters, :seller
    attr_reader :endpoint

    def initialize(options)
      self.endpoint = options[:endpoint]
      self.seller = options[:seller]
    end

    def endpoint=(country)
      @endpoint ||= Marketplace::Endpoint[country]
    end

    def attributes
      { endpoint: endpoint, seller: seller }
    end

    def list_orders(options)
      request(Marketplace::ListOrder.create(options))
    end

    def request(parameters)
      Marketplace.request(:post, parameters.merge(attributes))
    end
  end
end
