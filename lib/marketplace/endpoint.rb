module Marketplace
  module Endpoint
    extend self

    ENDPOINTS = {
      :CA => "https://mws.amazonservices.ca",
      :DE => "https://mws.amazonservices.de",
      :FR => "https://mws.amazonservices.fr",
      :JP => "https://mws.amazonservices.jp",
      :US => "https://mws.amazonservices.com",
      :UK => "https://mws.amazonservices.co.uk"
    }

    DEFAULT = ENDPOINTS[:US]

    def all
      ENDPOINTS.values
    end

    def countries
      ENDPOINTS.keys
    end
  end
end
