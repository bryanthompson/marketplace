module Marketplace
  require 'marketplace/signature'
  require 'marketplace/credentials'

  class Request
    attr_accessor :parameters, :uri

    def initialize(uri, parameters={})
      self.uri        = uri
      self.parameters = parameters
    end

    def data
      Net::HTTP::Post.new(uri.path).tap do |post|
        qs = query_string
          .to_hash
          .merge("Signature" => signature.sign!)
        post.set_form_data(qs)
      end
    end

    def canonical_query_string
      query_string.construct!
    end

    def query_string
      Marketplace::QueryString.new(parameters)
    end

    def submit
      Net::HTTP.start(uri.host, 443, use_ssl: true) do |h|
        h.verify_mode = OpenSSL::SSL::VERIFY_NONE
        h.request(data)
      end
    end

    private
    def credentials
      Marketplace::Credentials.instance
    end

    def signature
      Signature.new(canonical_query_string)
    end
  end
end
