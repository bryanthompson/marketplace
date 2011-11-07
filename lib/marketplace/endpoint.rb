module Marketplace
  module Endpoint
    ALL = {
      :CA => "mws.amazonservices.ca",
      :DE => "mws.amazonservices.de",
      :FR => "mws.amazonservices.fr",
      :JP => "mws.amazonservices.jp",
      :US => "mws.amazonservices.com",
      :UK => "mws.amazonservices.co.uk"
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

    DEFAULT = self[:US]
  end
end
