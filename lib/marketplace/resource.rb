module Marketplace
  class Resource
    def self.build(url)
      URI.parse(url)
    end
  end
end
