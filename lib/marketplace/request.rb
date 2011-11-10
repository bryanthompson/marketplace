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
      query_string.to_hash
      # Net::HTTP::Post.new(uri.path).tap do |post|
      #   post.set_form_data(query_string.to_hash)
      # end
    end

    def submit
      puts data
      # Net::HTTP.start(uri.host, 443, use_ssl: true) do |h|
      #   h.verify_mode = OpenSSL::SSL::VERIFY_NONE
      #   h.request(data)
      # end
    end

    private
    def credentials
      Marketplace::Credentials.instance
    end

    def query_string
      Marketplace::QueryString.new(parameters, uri.path)
    end
  end
end
