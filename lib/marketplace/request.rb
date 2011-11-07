module Marketplace
  require 'marketplace/signature'
  require 'marketplace/credentials'

  class Request
    attr_accessor :parameters, :uri

    def initialize(uri, parameters={})
      self.uri        = uri
      self.parameters = parameters
    end

    def http
      Net::HTTP.new(uri.to_s, 443).tap do |h|
        h.use_ssl = true
        h.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    def parameters=(params)
      @parameters ||= params.merge(signature.to_params)
    end

    def query_string
      Marketplace::QueryString.build(parameters)
    end

    def submit
      http.request(query_string)
    end

    private
    def secret_key
      Marketplace::Credentials.instance.secret_key
    end

    def signature
      Marketplace::Signature.new(secret_key)
    end
  end
end
