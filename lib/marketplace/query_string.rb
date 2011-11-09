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

    def parts=(parts)
      @parts ||= parts
        .merge(timestamp.to_params)
        .merge(credentials.to_params)
        .merge(Marketplace::Signature.to_params)
        .merge(AWSAccessKeyId: credentials.aws_access_key_id)
    end

    def parts
      Hash[@parts.map { |k,v| [camelize(k),v] }]
    end

    def parameters
      "?" + parts.to_query
    end

    def to_hash
      parts
    end

    private
    def camelize(name)
      name.to_s.camelize.gsub(" ", "")
    end

    def credentials
      Marketplace::Credentials.instance
    end

    def timestamp
      Marketplace::Timestamp
    end
  end
end
