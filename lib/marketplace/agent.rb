module Marketplace
  class Agent
    def self.get(uri)
      Net::HTTP::get(uri) if uri
    end
  end
end
