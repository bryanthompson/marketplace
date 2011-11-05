module Marketplace
  require 'net/http'

  class Agent
    def self.get(uri, params)
      Net::HTTP.get(uri)
    end

    def self.post(uri, params)
      Net::HTTP.post_form(uri, params)
    end
  end
end
