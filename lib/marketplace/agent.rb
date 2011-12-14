module Marketplace
  require 'net/https'

  module Agent
    extend self

    def get(uri, params)
      Net::HTTP.get(uri)
    end

    def post(uri, params)
      request(uri, params)
    end

    def request(uri, params, body=nil)
      Marketplace::Request.new(uri, params, body)
    end
  end
end
