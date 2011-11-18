module Marketplace

  class Request
    attr_accessor :parameters, :uri

    def initialize(uri, parameters={})
      self.uri        = uri
      self.parameters = parameters
    end

    def data
      Net::HTTP::Post.new(uri.path).tap do |post|
        post.set_form_data(query_string.to_hash)
      end
    end

    def submit
      Net::HTTP.start(uri.host, 443, use_ssl: true) do |h|
        h.verify_mode = OpenSSL::SSL::VERIFY_NONE
        h.request(data)
      end
    end

    private
    def query_string
      Marketplace::QueryString.new(uri.path, parameters)
    end
  end
end
