module Marketplace
  require 'uri'
  require 'active_support/core_ext'

  class QueryString
    attr_accessor :parts

    def initialize(parts)
      self.parts = parts
    end

    def self.build(parts)
      raise Marketplace::Exceptions::QueryStringArgumentError unless parts
      new(parts)
    end

    def construct!
      URI.parse(parameters)
    end

    def parameters
      "?" + parts.to_query
    end
  end
end
