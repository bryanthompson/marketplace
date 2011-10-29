module Marketplace
  class Resource
    def self.build(params)
      URI.parse(params[:url])
    end
  end
end
