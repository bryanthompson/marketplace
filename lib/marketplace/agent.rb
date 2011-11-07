module Marketplace
  require 'net/https'

  module Agent
    extend self

    def get(uri, params)
      Net::HTTP.get(uri)
    end

    def post(uri, params)
      request(uri, params).submit
    end

    def request(uri, params)
      Marketplace::Request.new(uri, params)
    end
  end
end
