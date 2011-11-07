module Marketplace
  require 'net/https'

  class Agent
    def self.get(uri, params)
      Net::HTTP.get(uri)
    end

    def self.post(uri, params)
      request(uri, params)
    end

    def self.request(uri, params)
      Marketplace::Request.new(uri, params)
    end
  end
end
