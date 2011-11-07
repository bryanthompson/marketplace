module Marketplace
  require 'cgi'
  require 'active_support/core_ext'

  class QueryString
    attr_writer :parts

    def initialize(parts)
      self.parts = parts
    end

    def self.build(parts)
      raise Marketplace::Exceptions::QueryStringArgumentError unless parts
      new(parts).construct!
    end

    def construct!
      CGI.escape(parameters)
    end

    def parts
      Hash[@parts.map {|k,v| [titleize(k),v]}]
    end

    def parameters
      "?" + parts.to_query
    end

    private
    def titleize(name)
      name.to_s.titleize.gsub(" ", "")
    end
  end
end
