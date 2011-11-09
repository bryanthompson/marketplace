module Marketplace
  module Endpoint
    ALL = {
      :CA => "https://mws.amazonservices.ca",
      :DE => "https://mws.amazonservices.de",
      :FR => "https://mws.amazonservices.fr",
      :JP => "https://mws.amazonservices.jp",
      :US => "https://mws.amazonservices.com",
      :UK => "https://mws.amazonservices.co.uk"
    }

    def self.[](key)
      ALL[key.to_sym]
    end

    def self.all
      ALL
    end

    def self.countries
      ALL.keys.map(&:to_s)
    end

    def self.default
      self[:US].gsub("https:\/\/", "")
    end
  end
end
