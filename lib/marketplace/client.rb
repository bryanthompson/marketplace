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
      @response = request(Marketplace::ListOrder.create(options))
    end

    def request_report(options)
      @response = request(Marketplace::RequestReport.create(options))
    end

    def get_report_list(options={})
      @response = request(Marketplace::GetReportList.create(options))
    end

    def get_report(options)
      @response = request(Marketplace::GetReport.create(options))
    end

    def request(parameters)
      Marketplace.request(:post, parameters.merge(attributes))
    end

    def response
      Marketplace::Response.parse(@response)
    end
  end
end
