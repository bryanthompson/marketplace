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
      @response = request(Marketplace::ListOrder.create(options)).submit
    end

    def request_report(options)
      @response = request(Marketplace::RequestReport.create(options)).submit
    end

    def get_report_list(options={})
      @response = request(Marketplace::GetReportList.create(options)).submit
    end

    def get_report(options)
      @response = request(Marketplace::GetReport.create(options)).submit
    end

    def submit_feed(body, options)
      @response = request(Marketplace::Feed.submit(options)).tap do |r|
        r.body = body
      end.submit
    end

    def request(parameters)
      Marketplace.request(:post, parameters.merge(attributes))
    end

    def response
      Marketplace::Response.parse(@response)
    end
  end
end
